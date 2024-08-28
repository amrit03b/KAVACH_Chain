// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComplaintSystem {
    struct Complaint {
        uint id;
        string heading;
        string description;
        string image;
        string location;
        address complainant;
        uint timestamp;
    }

    uint public complaintCount = 0;
    mapping(uint => Complaint) public complaints;

    event ComplaintCreated(
        uint id,
        string heading,
        string description,
        string image,
        string location,
        address indexed complainant,
        uint timestamp
    );

    function createComplaint(
        string memory _heading,
        string memory _description,
        string memory _image,
        string memory _location
    ) public {
        complaintCount++;
        complaints[complaintCount] = Complaint(
            complaintCount,
            _heading,
            _description,
            _image,
            _location,
            msg.sender,
            block.timestamp
        );

        emit ComplaintCreated(
            complaintCount,
            _heading,
            _description,
            _image,
            _location,
            msg.sender,
            block.timestamp
        );
    }

    function getComplaint(uint _id) public view returns (
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        address,
        uint
    ) {
        Complaint memory complaint = complaints[_id];
        return (
            complaint.id,
            complaint.heading,
            complaint.description,
            complaint.image,
            complaint.location,
            complaint.complainant,
            complaint.timestamp
        );
    }
}
