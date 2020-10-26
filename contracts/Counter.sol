// SPDX-License-Identifier: MIT
// Code snippet from Blockchain in Action
pragma solidity ^0.5.0;

contract Counter {
    int value; // positive value counter
    
    modifier checkIfLessThanValue(int n) {
        require(n <= value, 'Counter cannot become negative');
        _;
    }
    
    modifier checkIfNegative(int n) {
        require(n > 0, 'Value must be greater than zero');
        _;
    }
    
    function initialize(int n) public checkIfNegative(n) {
        value = n;
    }
    
    function get() view public returns (int) {
        return value;
    }
    
    function increment(int n) public checkIfNegative(n) {
        value += n;
    }
    
    function decrement(int n) public checkIfNegative(n) checkIfLessThanValue(n) {
        value -= n;
    }
}