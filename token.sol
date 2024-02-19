// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NetflixAccount {
    bool public accountOpen;

    event NetflixAccountOpened();
    event NetflixAccountClosed();
    event NetflixAccountReverted();

    constructor() {
        accountOpen = false;
    }

    function openNetflixAccount() public {
        require(!accountOpen, "Netflix account is already open");
        accountOpen = true;
        emit NetflixAccountOpened();
    }

    function closeNetflixAccount() public {
        require(accountOpen, "Netflix account is already closed");
        accountOpen = false;
        emit NetflixAccountClosed();
    }

    function revertNetflixAccount() public {
        accountOpen = !accountOpen;
        emit NetflixAccountReverted();
      
        if (accountOpen==false) {
           assert(accountOpen == false); 
            revert("Netflix account status falsely reverted");
        }
    }
}
