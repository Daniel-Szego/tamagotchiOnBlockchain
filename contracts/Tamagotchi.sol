pragma solidity ^0.6.0;


/// @author Daniel Szego
/// @title simple Tamagotchi implementation
contract Tamagotchi {

  /// VARIABLES
  /// @notice name of the Tamagotchi
  string public name;
  /// @notice level of the hunger
  uint8 public hungerLevel;
  /// @notice sleep level
  uint8 public sleepLevel;
  /// @notice play level
  uint8 public playLevel;
  /// @notice is the Tamagotchi alive
  bool public isAlive;
  /// @notice reward for the heartbeat
  uint256 public heartbeatReward;

  /// EVENTS

  /// @notice the Tamagotchi has been created
  event TamagotchiCreated(string indexed _name);
  /// @notice the Tamagotchi has died
  event TamagotchiDied(string indexed _name);

  /// CONSTRUCTOR

  constructor(string memory _name, uint256 _hearbeatReward) payable public {
      name = _name;
      hungerLevel = 100;
      sleepLevel = 100;
      playLevel = 100;
      heartbeatReward = _hearbeatReward;
      emit TamagotchiCreated(name);
  }

  /// MODIFIERS

  /// @notice is the Tamagotchi elive
  modifier isTamagotchiAlive {
    require(isAlive); 
    _;
  }

  /// @notice getting how much funding remained to keep the Tamagotchi alive
  function getRemainingHeartbeatFunding() public returns (uint256) {
    return address(this).balance;
  }

  /// TRANSACTIONS

  /// @notice heartbeat of the digital organism
  function heartbeat() isTamagotchiAlive public {
      hungerLevel = hungerLevel - 5;
      sleepLevel = 100 - 5;
      playLevel = 100 - 5;
      payable(msg.sender).transfer(heartbeatReward);
  }

  /// @notice feed the digital organism
  function feed() isTamagotchiAlive public {

  }

  /// @notice sleep the digital organism
  function sleep() isTamagotchiAlive public {
      
  }

  /// @notice play the digital organism
  function play() isTamagotchiAlive public {
      
  }

  /// @notice fallback function
  fallback() payable external { 
  }

}


