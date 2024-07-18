package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Evaluate;
import com.ruoyi.system.domain.Sensitive;
import com.ruoyi.system.service.IEvaluateService;
import com.ruoyi.system.service.ISensitiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 景点评价Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/evaluate")
public class EvaluateController extends BaseController
{
    @Autowired
    private IEvaluateService evaluateService;

    @Autowired
    private ISensitiveService sensitiveService;

    /**
     * 查询景点评价列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Evaluate evaluate)
    {
        startPage();
        List<Evaluate> list = evaluateService.selectEvaluateList(evaluate);
        return getDataTable(list);
    }

    /**
     * 获取景点评价详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(evaluateService.selectEvaluateById(id));
    }

    /**
     * 我的评论
     * @return
     */
    @GetMapping("/my")
    public AjaxResult getMyEvaluate(){
        return AjaxResult.success(evaluateService.getMyEvaluate());
    }
    /**
     * 新增景点评价
     */
    @PostMapping
    public AjaxResult add(@RequestBody Evaluate evaluate)
    {
        List<Sensitive> sensitives = sensitiveService.selectSensitiveList(new Sensitive());
        List<String> sensitiveList = new ArrayList<>();
        for (Sensitive sensitive : sensitives) {
            sensitiveList.add(sensitive.getName());
        }
        BanWordUtil banWordUtil = new BanWordUtil();
        Map map = banWordUtil.initKeyWord(sensitiveList);
        String s = banWordUtil.replaceSensitiveWord(evaluate.getContent(), BanWordUtil.minMatchTYpe, "*");
        evaluate.setContent(s);
        evaluate.setName(SecurityUtils.getLoginUser().getUser().getNickName());
        evaluate.setCreateUser(SecurityUtils.getUserId().intValue());
        evaluate.setCreateTime(DateUtils.getNowDate());
        return toAjax(evaluateService.insertEvaluate(evaluate));
    }

    /**
     * 修改景点评价
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Evaluate evaluate)
    {
        return toAjax(evaluateService.updateEvaluate(evaluate));
    }

    /**
     * 删除景点评价
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(evaluateService.deleteEvaluateByIds(ids));
    }

    /**
     * 获取景点评论
     * @param sid
     * @return
     */
    @GetMapping("/getList")
    public AjaxResult getList(@RequestParam("sid") Integer sid){
        return AjaxResult.success(evaluateService.getList(sid));
    }
}
