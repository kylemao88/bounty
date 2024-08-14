// SPDX-License-Identifier: UNLICENSED
progma solidity ^0.8.17;


/// @title 赏金任务： 
/// 1. 发布人在链上发布任务， 指定任务执行人，同时为该任务提供一定额度的赏金；
/// 2. 任务执行人在完成任务之后，可从发布人处获取signature，凭此sig，提现对应的赏金金额,如有剩余金额退还给任务发布人；
/// 3. 或者由第三方仲裁者（同样是在任务完成以后）从发布人处获取signature，凭此sig，提现给任务对应的执行人赏金金额，如有剩余金额退还给任务发布人；
interface ITask {

    /// 发布任务 
    function createTask(
        uint _taskId,
        address _worker,
        address _token,
        uint _amount
    ) external;

    /// 提现 
    function withdraw(
        uint _taskId,
        uint amount,
        uint deadline,
        bytes memory signature
    ) external;

    /// 仲裁
    function arbitrate(
        uint _taskId,
        uint amount,
        uint sigAmount,
        uint sigDeadline,
        bytes memory signature
    )external;

    ///
    function getTaskInfo(
        uint256 taskId
    ) external view returns(TaskInfo memory);

}