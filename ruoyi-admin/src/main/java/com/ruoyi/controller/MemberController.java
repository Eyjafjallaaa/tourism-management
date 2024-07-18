package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Member;
import com.ruoyi.system.service.IMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 会员Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/member")
public class MemberController extends BaseController
{
    @Autowired
    private IMemberService memberService;

    /**
     * 查询会员列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Member member)
    {
        startPage();
        List<Member> list = memberService.selectMemberList(member);
        return getDataTable(list);
    }

    /**
     * 获取会员详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(memberService.selectMemberById(id));
    }
    
    /**
     * 新增会员
     */
    @PostMapping
    public AjaxResult add(@RequestBody Member member)
    {

        member.setCreateTime(DateUtils.getNowDate());
        member.setCreateUser(SecurityUtils.getUserId().intValue());
        return toAjax(memberService.insertMember(member));
    }

    /**
     * 修改会员
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Member member)
    {
        member.setUpdateTime(DateUtils.getNowDate());
        member.setUpdateUser(SecurityUtils.getUserId().intValue());
        return toAjax(memberService.updateMember(member));
    }

    /**
     * 删除会员
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(memberService.deleteMemberByIds(ids));
    }
}
