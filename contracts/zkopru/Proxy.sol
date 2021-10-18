// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

import { Storage } from "./storage/Storage.sol";
import { IConfigurable } from "./interfaces/IConfigurable.sol";
import { ICoordinatable } from "./interfaces/ICoordinatable.sol";
import { IUserInteractable } from "./interfaces/IUserInteractable.sol";
import { IMigratable } from "./interfaces/IMigratable.sol";
import { IDepositValidator } from "./interfaces/validators/IDepositValidator.sol";
import { IHeaderValidator } from "./interfaces/validators/IHeaderValidator.sol";
import { IMigrationValidator } from "./interfaces/validators/IMigrationValidator.sol";
import { IUtxoTreeValidator } from "./interfaces/validators/IUtxoTreeValidator.sol";
import { IWithdrawalTreeValidator } from "./interfaces/validators/IWithdrawalTreeValidator.sol";
import { INullifierTreeValidator } from "./interfaces/validators/INullifierTreeValidator.sol";
import { ITxValidator } from "./interfaces/validators/ITxValidator.sol";

/* solium-disable */

contract Proxy is Storage {
    /**
     * @notice This proxies supports the following interfaces
     *          - ICoordinatable.sol
     *          - IUserInteractable.sol
     *          - IMigratable.sol
     *          - Challenges
     *              - IDepositChallenge.sol
     *              - IHeaderChallenge.sol
     *              - IMigrationChallenge.sol
     *              - IUtxoTreeChallenge.sol
     *              - IWithdrawalTreeChallenge.sol
     *              - INullifierTreeChallenge.sol
     *              - ITxChallenge.sol
     */
    fallback() external payable {
        address addr = Storage.proxied[msg.sig];
        require(addr != address(0), "There is no proxy contract");
        (bool success, bytes memory result) = addr.delegatecall(msg.data);
        require(success, string(result));
    }

    /**
     * @dev See Coordinatable.sol's register() function
     */
    receive() external payable {}

    function _connectConfigurable(address addr) internal virtual {
        _connect(addr, IConfigurable.setMaxBlockSize.selector);
        _connect(addr, IConfigurable.setMaxValidationGas.selector);
        _connect(addr, IConfigurable.setChallengePeriod.selector);
        _connect(addr, IConfigurable.setMinimumStake.selector);
        _connect(addr, IConfigurable.setReferenceDepth.selector);
        _connect(addr, IConfigurable.setConsensusProvider.selector);
    }

    function _connectCoordinatable(address addr) internal {
        _connect(addr, ICoordinatable.register.selector);
        _connect(addr, ICoordinatable.stake.selector);
        _connect(addr, ICoordinatable.deregister.selector);
        _connect(addr, ICoordinatable.safePropose.selector);
        _connect(addr, ICoordinatable.propose.selector);
        _connect(addr, ICoordinatable.finalize.selector);
        _connect(addr, ICoordinatable.commitMassDeposit.selector);
        _connect(addr, ICoordinatable.withdrawReward.selector);
        _connect(addr, ICoordinatable.registerERC20.selector);
        _connect(addr, ICoordinatable.registerERC721.selector);
    }

    function _connectUserInteractable(address addr) internal {
        _connect(addr, IUserInteractable.deposit.selector);
        _connect(addr, IUserInteractable.withdraw.selector);
        _connect(addr, IUserInteractable.payInAdvance.selector);
    }

    function _connectMigratable(address addr) internal virtual {
        _connect(addr, IMigratable.transfer.selector);
        _connect(addr, IMigratable.migrateFrom.selector);
    }

    function _connectChallengeable(
        address challengeable,
        address depositValidator,
        address headerValidator,
        address migrationValidator,
        address utxoTreeValidator,
        address withdrawalTreeValidator,
        address nullifierTreeValidator,
        address txValidator
    ) internal virtual {
        _connect(challengeable, IDepositValidator.validateMassDeposit.selector);
        _connect(challengeable, IHeaderValidator.validateDepositRoot.selector);
        _connect(challengeable, IHeaderValidator.validateTxRoot.selector);
        _connect(challengeable, IHeaderValidator.validateMigrationRoot.selector);
        _connect(challengeable, IHeaderValidator.validateTotalFee.selector);
        _connect(challengeable, IMigrationValidator.validateDuplicatedMigrations.selector);
        _connect(challengeable, IMigrationValidator.validateEthMigration.selector);
        _connect(challengeable, IMigrationValidator.validateERC20Migration.selector);
        _connect(challengeable, IMigrationValidator.validateMergedLeaves.selector);
        _connect(challengeable, IMigrationValidator.validateMigrationFee.selector);
        _connect(challengeable, IMigrationValidator.validateTokenRegistration.selector);
        _connect(challengeable, IMigrationValidator.validateMissedMassMigration.selector);
        _connect(challengeable, IUtxoTreeValidator.validateUTXOIndex.selector);
        _connect(challengeable, IUtxoTreeValidator.validateUTXORoot.selector);
        _connect(challengeable, IWithdrawalTreeValidator.validateWithdrawalIndex.selector);
        _connect(challengeable, IWithdrawalTreeValidator.validateWithdrawalRoot.selector);
        _connect(challengeable, INullifierTreeValidator.validateNullifierRollUp.selector);
        _connect(challengeable, ITxValidator.validateInclusion.selector);
        _connect(challengeable, ITxValidator.validateOutflow.selector);
        _connect(challengeable, ITxValidator.validateAtomicSwap.selector);
        _connect(challengeable, ITxValidator.validateUsedNullifier.selector);
        _connect(challengeable, ITxValidator.validateDuplicatedNullifier.selector);
        _connect(challengeable, ITxValidator.validateSNARK.selector);
        _connectValidator(depositValidator, IDepositValidator.validateMassDeposit.selector);
        _connectValidator(headerValidator, IHeaderValidator.validateDepositRoot.selector);
        _connectValidator(headerValidator, IHeaderValidator.validateTxRoot.selector);
        _connectValidator(headerValidator, IHeaderValidator.validateMigrationRoot.selector);
        _connectValidator(headerValidator, IHeaderValidator.validateTotalFee.selector);
        _connectValidator(migrationValidator, IMigrationValidator.validateDuplicatedMigrations.selector);
        _connectValidator(migrationValidator, IMigrationValidator.validateEthMigration.selector);
        _connectValidator(migrationValidator, IMigrationValidator.validateERC20Migration.selector);
        _connectValidator(migrationValidator, IMigrationValidator.validateMergedLeaves.selector);
        _connectValidator(migrationValidator, IMigrationValidator.validateMigrationFee.selector);
        _connectValidator(migrationValidator, IMigrationValidator.validateTokenRegistration.selector);
        _connectValidator(migrationValidator, IMigrationValidator.validateMissedMassMigration.selector);
        _connectValidator(utxoTreeValidator, IUtxoTreeValidator.validateUTXOIndex.selector);
        _connectValidator(utxoTreeValidator, IUtxoTreeValidator.validateUTXORoot.selector);
        _connectValidator(withdrawalTreeValidator, IWithdrawalTreeValidator.validateWithdrawalIndex.selector);
        _connectValidator(withdrawalTreeValidator, IWithdrawalTreeValidator.validateWithdrawalRoot.selector);
        _connectValidator(nullifierTreeValidator, INullifierTreeValidator.validateNullifierRollUp.selector);
        _connectValidator(txValidator, ITxValidator.validateInclusion.selector);
        _connectValidator(txValidator, ITxValidator.validateOutflow.selector);
        _connectValidator(txValidator, ITxValidator.validateAtomicSwap.selector);
        _connectValidator(txValidator, ITxValidator.validateUsedNullifier.selector);
        _connectValidator(txValidator, ITxValidator.validateDuplicatedNullifier.selector);
        _connectValidator(txValidator, ITxValidator.validateSNARK.selector);
    }

    function _connect(address to, bytes4 sig) internal {
        proxied[sig] = to;
    }

    function _connectValidator(address to, bytes4 sig) internal {
        validators[sig] = to;
    }
}
