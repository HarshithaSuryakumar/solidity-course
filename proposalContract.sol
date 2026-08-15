// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {

    address public owner;
    uint256 public counter;

    struct Proposal {
        uint256 approve;
        uint256 reject;
        uint256 pass;
        string title;
    }

    mapping(uint256 => Proposal) public proposal_history;

    constructor() {
        owner = msg.sender;
        counter = 0;
    }

    // Create a new proposal
    function create(
        string memory title
    ) public {
        proposal_history[counter] = Proposal({
            approve: 0,
            reject: 0,
            pass: 0,
            title: title
        });

        counter++;
    }

    // Approve the current proposal
    function approve() public {
        proposal_history[counter - 1].approve++;
    }

    // Reject the current proposal
    function reject() public {
        proposal_history[counter - 1].reject++;
    }

    // Pass the current proposal
    function pass() public {
        proposal_history[counter - 1].pass++;
    }

    // Calculate whether the current proposal succeeded
    function calculateCurrentState() private view returns (bool) {
        Proposal storage proposal = proposal_history[counter - 1];

        uint approve = proposal.approve;
        uint reject = proposal.reject;

        // Our new logic:
        // Proposal succeeds if approve votes are
        // greater than or equal to reject votes.
        if (approve >= reject) {
            return true;
        } else {
            return false;
        }
    }

    // Get the current state of the proposal
    function getCurrentState() public view returns (bool) {
        return calculateCurrentState();
    }
}