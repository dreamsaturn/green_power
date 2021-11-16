pragma solidity ^0.4.0;

//file indeed for compile
//may store in somewhere and import
contract evidenceMap{
    event evUpdate(bytes32);
    mapping(bytes32 => string) public evidence;

    // function bytesToUint(bytes b) public pure returns (uint256){
    //     uint256 number;
    //     for(uint i= 0; i<b.length; i++){
    //         number = number + uint8(b[i])*(2**(8*(b.length-(i+1))));
    //     }
    //     return  number;
    // }

    function update(bytes32 key, string val) external returns (string){
      //  uint256  ekey = bytesToUint(key);
        evidence[key] = val;
        emit evUpdate(key);
        return val;
    }

    function select(bytes32 key) external view returns (string){
    //    uint256  ekey = bytesToUint(key);
        return evidence[key];
    }
}

contract Evidence{
    address conAddr = new evidenceMap();
    event Evikey(string key,string val);
    function putKey(string key, string val) public returns (string){
    //address not resolved!
    //tringing
      emit Evikey(key,val);
      return  evidenceMap(conAddr).update(sha256(bytes(key)),val);
    }
    function getKey(string key) public view returns (string){
    //address not resolved!
    //tringing
      return evidenceMap(conAddr).select(sha256(bytes(key)));
    }
}
