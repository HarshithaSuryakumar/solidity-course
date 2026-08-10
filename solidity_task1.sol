//SPDX-Licence-Identifier:MIT
pragma solidity ^0.8.18;
contract Example{
  address owner;
  struct counter{
    uint number;
    string description;
  }
Counter counter;
modifier onlyOwner(){
  require(msg.sender==owner,"Decreements and increments are only done by the owner")
  _;
}
constructo(uint intial_value,string memory description){
  owner==msg.sender;
  counter=Counter(intial_value,description);
}
function increment_counter() external onlyOwner{
  counter.number+=1;
}
function decrement_counter() external onlyOwner{
  counter-=1;
}
function get_counter_value() external view returns(uint){
  return counter.number;
}
function get_counter_description external view returns(string memory){
  return counter.description;
}




}
