// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;



abstract contract Employee {

uint public idNumber;
uint public managerId;






constructor (uint _idNumber, uint _managerId) {

    idNumber = _idNumber;
    managerId = _managerId;

}






function getAnnualCost() public virtual view returns (uint) {

}



}



contract Salaried is Employee  {

uint public annualSalary;

constructor (uint _annualSalary) {

    annualSalary = _annualSalary;

}

function getAnnualCost() public override view returns (uint) {
return annualSalary;

}


}



contract Hourly is Employee{

uint public hourlyRate;

uint public hours_time;


constructor () {

    hours_time = 2080;
}

function getAnnualCost() public override view returns (uint) {
return hourlyRate * hours_time;

}

}