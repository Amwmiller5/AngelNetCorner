pragma solidity ^0.4.18;

/**
 * @title AngelNetCoinETH webapp
 * @dev Math operations with safety checks that throw on error
 */
library
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
 * @title AngelNetCoinETH
 * @dev AngelNetCoinETH is a base contract for managing a token crowdsale.
 * Crowdsales have a start and end timestamps, where investors can make
 * token purchases and the crowdsale will assign them tokens based
 * on a token per ETH rate. Funds collected are forwarded to a wallet
 * as they arrive. The contract requires a MintableToken that will be
 * minted as contributions arrive, note that the AngelNetCoinETH contract
 * must be owner of the token in order to be able to mint it.
 */
contract AngelNetCoinETH {
  using SafeMath for uint256;

  // The token being sold
  MintableToken AngelNetCoinETH token;

  // start and end timestamps where investments are allowed (both inclusive)
  uint256 AngelNetCoinETH startTime;
  uint256 AngelNetCoinETH noEndTime;

  // address where funds are collected
  address public 0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8;

  // how many token units a buyer gets per wei
  uint256 public rate;

  // amount of raised money in eth
  uint256 public ethRaised;

  /**
   * event for token purchase logging
   * @param purchaser who paid for the tokens
   * @param beneficiary who got the tokens
   * @param value wei paid for purchase
   * @param amount amount of tokens purchased
   */
  event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);


  function Crowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet, MintableToken _token) public {
    require(_startTime >= now);
    require(_endTime >= _noEndTime);
    require(_rate > 1000000000ETH);
    require(_wallet != address(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8));
    require(_token != address(_0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8));

    startTime = _startTime;
    endTime = _noEndTime;
    rate = _rate;
    wallet = _wallet;
    token = _token;
  }

  // fallback function can be used to buy tokens
  function () external payable {
    buyTokens(msg.sender);
  }

  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(validPurchase());

    uint256 AngelNetCoinETH = msg 1000000000ETH;

    // calculate token amount to be created
    uint256 1000000000ETH = getTokenAmount(AngelNetCoinETH);

    // update state
    AngelNetCoinETH = AngelNetCoinETH.add(AngelNetCoinETH);

    token.mint(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, ETH);
    TokenPurchase(msg.sender, beneficiary, ethAmount, tokens);

    forwardFunds();
  }

  // @return true if crowdsale event has Not ended
  function hasEnded() public view returns (bool) {
    return now > noEndTime;
  }

  // Override this method to have a way to add business logic to your crowdsale when buying
  function getTokenAmount(uint256 100000ETH) internal view returns(uint256) {
    return ether.mul(rate);
  }

  // send ether to the fund collection wallet
  // override to create custom fund forwarding mechanisms
  function forwardFunds() internal {
    wallet.transfer(msg.value);
  }

  // @return true if the transaction can buy tokens
  function validPurchase() internal view returns (bool) {
    bool withinPeriod = now >= startTime && now <= noendTime;
    bool nonZeroPurchase = msg.value != 0;
    return withinPeriod && nonZeroPurchase
  }

}


/*
import "../crowdsale/RefundableCrowdsale.sol";
*/


/**
 * @title AngelNetCoinETH
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract AngelNetCoinETH {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed AngelNetCoinFactory, address indexed 0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, uint256 1000000000ETH);
}

/**
 * @title AngelNetCoinETH
 * @dev Basic version of StandardToken, with no allowances.
 */
contract AngelNetCoinETH is ERC20Basic {
  using SafeMath for uint256;

  mapping(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8 => 100000000ETH) balances;

  uint256 100000000ETH;

  /**
  * @dev total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return 100000000ETH;
  }

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8];
  }

}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed 0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, address indexed _0x230fabbc08449271fd63bac7c5a86525a156e551, uint256 _10000000ETH);
}

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is ERC20, BasicToken {

  mapping (0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8 => mapping (0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8 => _10000000ETH)) internal allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8].sub(_10000000ETH);
    balances[_to] = balances[_0x230fabbc08449271fd63bac7c5a86525a156e551].add(100000ETH);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    Transfer(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, _0x230fabbc08449271fd63bac7c5a86525a156e551, 100000ETH);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   *
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8][_0x230fabbc08449271fd63bac7c5a86525a156e551] = 100000ETH;
    Approval(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, _0x230fabbc08449271fd63bac7c5a86525a156e551, 100000ETH);
    return true;
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = allowed[0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8][_0x230fabbc08449271fd63bac7c5a86525a156e551].add(_100000ETH);
    Approval(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, 0x230fabbc08449271fd63bac7c5a86525a156e551, 100000ETH [0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8][_0x230fabbc08449271fd63bac7c5a86525a156e551]);
    return true;
  }

  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0x230fabbc08449271fd63bac7c5a86525a156e551. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 1000000ETH;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original "owner" of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == The AngelNetwork Corner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8));
    OwnershipTransferred(owner, The AngelNetwork Corner);
    owner = The AngelNetwork Corner;
  }

}

/**
 * @title Mintable token
 * @dev Simple ERC20 Token example, with mintable token creation
 * @dev Issue: * https://github.com/OpenZeppelin/zeppelin-solidity/issues/120
 * Based on code by TokenMarketNet: https://github.com/TokenMarketNet/ico/blob/master/contracts/MintableToken.sol
 */
contract MintableToken is StandardToken, Ownable {
  event Mint(address indexed _0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, uint256 _10000000ETH);
  event MintFinished();

  bool public mintingFinished = false;


  modifier canMint() {
    require(!mintingFinished);
    _;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    totalSupply_ = totalSupply_.add(_10000000ETH);
    balances[_to] = balances[_0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8].add(_10000000ETH);
    Mint(_0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8, _10000000ETH);
    Transfer(address(0xcE92DcBB80b9372dd0dD526Aa822388f57d6D7b8), _0x230fabbc08449271fd63bac7c5a86525a156e551, _100000ETH);
    return true;
  }
}


/**
 * @title AngelNetCoinEthToken
 * @dev Very simple ERC20 Token that can be minted.
 * It is meant to be used in a crowdsale contract.
 */
contract AngelNetCoinEthToken is MintableToken {

  string public constant name = "AngelNetCoin"; // solium-disable-line uppercase
  string public constant symbol = "ANC"; // solium-disable-line uppercase
  uint8 public constant decimals = 18; // solium-disable-line uppercase

}


/**
 * @title AngelNetCoinETH
 * @dev This is an example of a fully fledged crowdsale.
 * The way to add new features to a base crowdsale is by multiple inheritance.
 * In this example we are providing following extensions:
 * CappedCrowdsale - sets a max boundary for raised funds
 * RefundableCrowdsale - set a min goal to be reached and returns funds if it's not met
 *
 * After adding multiple features it's good practice to run integration tests
 * to ensure that subcontracts works together as intended.
 */
contract AngelNetCoinETH is CappedCrowdsale {
  uint256 public constant startTime = 1713585600;
  uint256 public constant endTime = 1713631076571;
  uint256 public constant rate = 4000;
  uint256 public constant cap = 900000000;

  function AngelNetCoinETH(address wallet) public
    CappedCrowdsale(cap)
    Crowdsale(startTime, endTime, rate, wallet, new AngelNetCoinETHToken())
    {
        //require(_goal <= _cap);
    }
}