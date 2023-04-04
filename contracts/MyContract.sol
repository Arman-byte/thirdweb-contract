// code



// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.22 <0.9.0;

import "@thirdweb-dev/contracts/base/ERC721Drop.sol";
import "@openzeppelin/contracts/utils/Base64.sol";


// Integrazione licenza can't be evil
// https://github.com/a16z/a16z-contracts/blob/master/README.md
import {LicenseVersion, CantBeEvil} from "@a16z/contracts/licenses/CantBeEvil.sol";


contract MyContract is ERC721Drop, CantBeEvil{
    constructor(
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps,
        address _primarySaleRecipient
    )
    
    
        ERC721Drop(
            _name,
            _symbol,
            _royaltyRecipient,
            _royaltyBps,
            _primarySaleRecipient
        )

        CantBeEvil(LicenseVersion.PUBLIC)
    {}
        //this function needs to be in the contract                                
        function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721Drop, CantBeEvil) returns (bool) {
    return super.supportsInterface(interfaceId) || CantBeEvil.supportsInterface(interfaceId);
    }
}





