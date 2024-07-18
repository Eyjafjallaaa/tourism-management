package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.Member;
import com.ruoyi.system.domain.Viper;
import com.ruoyi.system.service.IMemberService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.IViperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 会员Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/viper")
public class ViperController extends BaseController
{
    @Autowired
    private IViperService viperService;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private IMemberService memberService;
    @Autowired
    private TokenService tokenService;
    /**
     * 查询会员列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Viper viper)
    {
        startPage();
        List<Viper> list = viperService.selectViperList(viper);
        return getDataTable(list);
    }

    /**
     * 获取会员详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(viperService.selectViperById(id));
    }

    /**
     * 新增会员
     */
    @PostMapping
    public AjaxResult add(@RequestBody Viper viper)
    {
        viper.setUid(SecurityUtils.getUserId().intValue());
        List<Viper> vipers = viperService.selectViperList(viper);
        Assert.isTrue(vipers.size()==0,"您已经是会员");
        viper.setCreateUser(SecurityUtils.getUserId().intValue());
        viper.setCreateTime(DateUtils.getNowDate());
        viper.setUid(SecurityUtils.getUserId().intValue());
        viper.setUname(SecurityUtils.getLoginUser().getUser().getNickName());
        viper.setIntegral("0");
        LoginUser loginUser = getLoginUser();
        SysUser sysUser = loginUser.getUser();
        sysUser.setUserId(viper.getUid().longValue());
        sysUser.setRemark("会员");
        userService.updateUser(sysUser);
        tokenService.setLoginUser(loginUser);
        int i = viperService.insertViper(viper);
        if (i>0){
            Member member = memberService.selectMemberList(new Member()).get(0);
            List<Member> list=new ArrayList<>();
            list.add(member);
            return AjaxResult.success(list);
        }else {
            return AjaxResult.error();
        }
    }

    /**
     * 获取积分
     * @return
     */
    @GetMapping("/integral")
    public AjaxResult getIntegral(){
        Viper integral = viperService.getIntegral();
        if (Objects.nonNull(integral)){
            return AjaxResult.success(integral);
        }else {
            Viper viper = new Viper();
            viper.setIntegral("0");
            return AjaxResult.success(viper);
        }
    }

    /**
     * 修改会员
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Viper viper)
    {
        return toAjax(viperService.updateViper(viper));
    }

    /**
     * 删除会员
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(viperService.deleteViperByIds(ids));
    }
}
