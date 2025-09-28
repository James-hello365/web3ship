pragma solidity ^0.8.0;

contract Voting{
    mapping (string topic => mapping(address candidate => uint vote)) public votesByTopic; //公开投票，可以根据个人喜好任意投票，不设置候选人名单，根据每个主题，给每个候选人【任何有效地址即为候选人】投一票

	//参与特定的主题，给候选人投票
    function vote(address _address,string memory topic) public{
        require( _address != address(this), "can not vote to contract");
        require( bytes(topic).length != 0, "topic is empty");
        votesByTopic[topic][_address] += 1;
    }

    function getVotes(address _address,string memory topic) public view returns(uint){
        require(_address != address(0), "address not exist");
        return votesByTopic[topic][_address] ;
    }

    function resetVotes(string memory topic) public{
        delete votesByTopic[topic];
    }
}


// contract Voting{
//     address[] candidates;
//     mapping (address candidate => uint vote) public votes;
//     function addCandidate(address _address) public {
//         bool isExist = false;
//         for(uint16 i=0;i<candidates.length;i++){
//             if (_address == candidates[i]){
//                 isExist = true;
//                 break ;
//             }
            
//         }
//         if(!isExist){
//             candidates.push(_address);
//         }
//     }
//     function vote(address _address) public{
//         require(_address == address(this), "can not vote to contract");
//         votes[_address] += 1;
//     }
//     function getVotes(address _address) public view returns(uint){
//         return votes[_address];
//     }
//     function resetVotes() public{
//         delete votes;
//         for(uint16 i=0;i<candidates.length;i++){
//             if(votes[candidates[i]]!=0){
//                 votes[candidates[i]] = 0;
//             }
//         }
//     }
// }