pragma solidity ^0.8.0;

import { Hasher } from "./MerkleTree.sol";

library Poseidon2 {
    /**
     * @dev This is a dummy implementation for contract compilation
     * We'll use a generated library by circomlib instead of this dummy library
     * Please see
     * 1. migrations/3_deploy_poseidon.js
     * 2. https://github.com/iden3/circomlib/blob/master/src/poseidon_gencontract.js
     */
    function poseidon(uint256[2] calldata) external pure returns (uint256) {
        return 0;
    }
}

library Poseidon3 {
    /**
     * @dev This is a dummy implementation for contract compilation
     * We'll use a generated library by circomlib instead of this dummy library
     * Please see
     * 1. migrations/3_deploy_poseidon.js
     * 2. https://github.com/iden3/circomlib/blob/master/src/poseidon_gencontract.js
     */
    function poseidon(uint256[3] calldata) external pure returns (uint256) {
        return 0;
    }
}

library Poseidon4 {
    /**
     * @dev This is a dummy implementation for contract compilation
     * We'll use a generated library by circomlib instead of this dummy library
     * Please see
     * 1. migrations/3_deploy_poseidon.js
     * 2. https://github.com/iden3/circomlib/blob/master/src/poseidon_gencontract.js
     */
    function poseidon(uint256[4] calldata) external pure returns (uint256) {
        return 0;
    }
}

/**
 * @dev This will be used to provide hash functions to calculate roll up.
 *      Please see MerkleTreeLib.sol from 'merkle-tree-rollup'.
 */
library Hash {
    uint256 constant k = 21888242871839275222246405745257275088548364400416034343698204186575808495617;

    function poseidon() internal pure returns (Hasher memory) {
        return Hasher(poseidonParentOf, poseidonPrehashedZeroes());
    }

    /**
     * @dev Costs about 100k gas
     */
    function poseidonParentOf(uint256 left, uint256 right) internal pure returns (uint256) {
        uint256[2] memory res = [left, right];
        try Poseidon2.poseidon(res) returns (uint256 val) {
            return val;
        } catch {
            revert("poseidon hash error");
        }
    }

    function poseidonPrehashedZeroes() internal pure returns (uint256[] memory preHashed) {
        preHashed = new uint256[](49);
        preHashed[0] = 0;
        preHashed[1] = 14744269619966411208579211824598458697587494354926760081771325075741142829156;
        preHashed[2] = 7423237065226347324353380772367382631490014989348495481811164164159255474657;
        preHashed[3] = 11286972368698509976183087595462810875513684078608517520839298933882497716792;
        preHashed[4] = 3607627140608796879659380071776844901612302623152076817094415224584923813162;
        preHashed[5] = 19712377064642672829441595136074946683621277828620209496774504837737984048981;
        preHashed[6] = 20775607673010627194014556968476266066927294572720319469184847051418138353016;
        preHashed[7] = 3396914609616007258851405644437304192397291162432396347162513310381425243293;
        preHashed[8] = 21551820661461729022865262380882070649935529853313286572328683688269863701601;
        preHashed[9] = 6573136701248752079028194407151022595060682063033565181951145966236778420039;
        preHashed[10] = 12413880268183407374852357075976609371175688755676981206018884971008854919922;
        preHashed[11] = 14271763308400718165336499097156975241954733520325982997864342600795471836726;
        preHashed[12] = 20066985985293572387227381049700832219069292839614107140851619262827735677018;
        preHashed[13] = 9394776414966240069580838672673694685292165040808226440647796406499139370960;
        preHashed[14] = 11331146992410411304059858900317123658895005918277453009197229807340014528524;
        preHashed[15] = 15819538789928229930262697811477882737253464456578333862691129291651619515538;
        preHashed[16] = 19217088683336594659449020493828377907203207941212636669271704950158751593251;
        preHashed[17] = 21035245323335827719745544373081896983162834604456827698288649288827293579666;
        preHashed[18] = 6939770416153240137322503476966641397417391950902474480970945462551409848591;
        preHashed[19] = 10941962436777715901943463195175331263348098796018438960955633645115732864202;
        preHashed[20] = 15019797232609675441998260052101280400536945603062888308240081994073687793470;
        preHashed[21] = 11702828337982203149177882813338547876343922920234831094975924378932809409969;
        preHashed[22] = 11217067736778784455593535811108456786943573747466706329920902520905755780395;
        preHashed[23] = 16072238744996205792852194127671441602062027943016727953216607508365787157389;
        preHashed[24] = 17681057402012993898104192736393849603097507831571622013521167331642182653248;
        preHashed[25] = 21694045479371014653083846597424257852691458318143380497809004364947786214945;
        preHashed[26] = 8163447297445169709687354538480474434591144168767135863541048304198280615192;
        preHashed[27] = 14081762237856300239452543304351251708585712948734528663957353575674639038357;
        preHashed[28] = 16619959921569409661790279042024627172199214148318086837362003702249041851090;
        preHashed[29] = 7022159125197495734384997711896547675021391130223237843255817587255104160365;
        preHashed[30] = 4114686047564160449611603615418567457008101555090703535405891656262658644463;
        preHashed[31] = 12549363297364877722388257367377629555213421373705596078299904496781819142130;
        preHashed[32] = 21443572485391568159800782191812935835534334817699172242223315142338162256601;
        preHashed[33] = 7694308195910501081009121293114024464085863242234210875116972222894508088593;
        preHashed[34] = 19436655221357744084268084733086758091063031655958874977393275057113871387612;
        preHashed[35] = 504560679421594568008785884377411103919276592025608068716624135509042913445;
        preHashed[36] = 15514326198544383705779305874810179498683015466891608623734708520949427780297;
        preHashed[37] = 18050509671301509180529516585664868376547568536829464907482108610907095064846;
        preHashed[38] = 19325995768811681758893355971515631026389726043952646765279836704328238552444;
        preHashed[39] = 8113285533935262288634445323179958309977466935574634157770415170084803339932;
        preHashed[40] = 8687547638004116013653730449839507042090717944911454416140763808366589487233;
        preHashed[41] = 4219934094845838724099095219278168649992089956853624078935311899188458960130;
        preHashed[42] = 21510527040952709378449317309184621997982521234980256342111982994820444178998;
        preHashed[43] = 16272061764917814078206842113147941744775443333197972862535270406092765485800;
        preHashed[44] = 11950748278519216592208446055847647646851748187875167692033825912643212561651;
        preHashed[45] = 13217514242688721231526300645683365940672260351011673655350090258342076523833;
        preHashed[46] = 10660970513545137636556840216974086019554277128425442705829279218492801035189;
        preHashed[47] = 8948131039435020321600800327463711558797205831163955397039898101595579105221;
        preHashed[48] = 16906416606242269641303814566664742915713407815915901992512191641691459855175;
    }

    function keccak() internal pure returns (Hasher memory) {
        return Hasher(keccakParentOf, keccakPrehashedZeroes());
    }

    function keccakParentOf(uint256 left, uint256 right) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(left, right)));
    }

    function keccakPrehashedZeroes() internal pure returns (uint256[] memory preHashed) {
        preHashed = new uint256[](49);
        preHashed[0] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        preHashed[1] = 0xad3228b676f7d3cd4284a5443f17f1962b36e491b30a40b2405849e597ba5fb5;
        preHashed[2] = 0xb4c11951957c6f8f642c4af61cd6b24640fec6dc7fc607ee8206a99e92410d30;
        preHashed[3] = 0x21ddb9a356815c3fac1026b6dec5df3124afbadb485c9ba5a3e3398a04b7ba85;
        preHashed[4] = 0xe58769b32a1beaf1ea27375a44095a0d1fb664ce2dd358e7fcbfb78c26a19344;
        preHashed[5] = 0x0eb01ebfc9ed27500cd4dfc979272d1f0913cc9f66540d7e8005811109e1cf2d;
        preHashed[6] = 0x887c22bd8750d34016ac3c66b5ff102dacdd73f6b014e710b51e8022af9a1968;
        preHashed[7] = 0xffd70157e48063fc33c97a050f7f640233bf646cc98d9524c6b92bcf3ab56f83;
        preHashed[8] = 0x9867cc5f7f196b93bae1e27e6320742445d290f2263827498b54fec539f756af;
        preHashed[9] = 0xcefad4e508c098b9a7e1d8feb19955fb02ba9675585078710969d3440f5054e0;
        preHashed[10] = 0xf9dc3e7fe016e050eff260334f18a5d4fe391d82092319f5964f2e2eb7c1c3a5;
        preHashed[11] = 0xf8b13a49e282f609c317a833fb8d976d11517c571d1221a265d25af778ecf892;
        preHashed[12] = 0x3490c6ceeb450aecdc82e28293031d10c7d73bf85e57bf041a97360aa2c5d99c;
        preHashed[13] = 0xc1df82d9c4b87413eae2ef048f94b4d3554cea73d92b0f7af96e0271c691e2bb;
        preHashed[14] = 0x5c67add7c6caf302256adedf7ab114da0acfe870d449a3a489f781d659e8becc;
        preHashed[15] = 0xda7bce9f4e8618b6bd2f4132ce798cdc7a60e7e1460a7299e3c6342a579626d2;
        preHashed[16] = 0x2733e50f526ec2fa19a22b31e8ed50f23cd1fdf94c9154ed3a7609a2f1ff981f;
        preHashed[17] = 0xe1d3b5c807b281e4683cc6d6315cf95b9ade8641defcb32372f1c126e398ef7a;
        preHashed[18] = 0x5a2dce0a8a7f68bb74560f8f71837c2c2ebbcbf7fffb42ae1896f13f7c7479a0;
        preHashed[19] = 0xb46a28b6f55540f89444f63de0378e3d121be09e06cc9ded1c20e65876d36aa0;
        preHashed[20] = 0xc65e9645644786b620e2dd2ad648ddfcbf4a7e5b1a3a4ecfe7f64667a3f0b7e2;
        preHashed[21] = 0xf4418588ed35a2458cffeb39b93d26f18d2ab13bdce6aee58e7b99359ec2dfd9;
        preHashed[22] = 0x5a9c16dc00d6ef18b7933a6f8dc65ccb55667138776f7dea101070dc8796e377;
        preHashed[23] = 0x4df84f40ae0c8229d0d6069e5c8f39a7c299677a09d367fc7b05e3bc380ee652;
        preHashed[24] = 0xcdc72595f74c7b1043d0e1ffbab734648c838dfb0527d971b602bc216c9619ef;
        preHashed[25] = 0x0abf5ac974a1ed57f4050aa510dd9c74f508277b39d7973bb2dfccc5eeb0618d;
        preHashed[26] = 0xb8cd74046ff337f0a7bf2c8e03e10f642c1886798d71806ab1e888d9e5ee87d0;
        preHashed[27] = 0x838c5655cb21c6cb83313b5a631175dff4963772cce9108188b34ac87c81c41e;
        preHashed[28] = 0x662ee4dd2dd7b2bc707961b1e646c4047669dcb6584f0d8d770daf5d7e7deb2e;
        preHashed[29] = 0x388ab20e2573d171a88108e79d820e98f26c0b84aa8b2f4aa4968dbb818ea322;
        preHashed[30] = 0x93237c50ba75ee485f4c22adf2f741400bdf8d6a9cc7df7ecae576221665d735;
        preHashed[31] = 0x8448818bb4ae4562849e949e17ac16e0be16688e156b5cf15e098c627c0056a9;
        preHashed[32] = 0x27ae5ba08d7291c96c8cbddcc148bf48a6d68c7974b94356f53754ef6171d757;
        preHashed[33] = 0xbf558bebd2ceec7f3c5dce04a4782f88c2c6036ae78ee206d0bc5289d20461a2;
        preHashed[34] = 0xe21908c2968c0699040a6fd866a577a99a9d2ec88745c815fd4a472c789244da;
        preHashed[35] = 0xae824d72ddc272aab68a8c3022e36f10454437c1886f3ff9927b64f232df414f;
        preHashed[36] = 0x27e429a4bef3083bc31a671d046ea5c1f5b8c3094d72868d9dfdc12c7334ac5f;
        preHashed[37] = 0x743cc5c365a9a6a15c1f240ac25880c7a9d1de290696cb766074a1d83d927816;
        preHashed[38] = 0x4adcf616c3bfabf63999a01966c998b7bb572774035a63ead49da73b5987f347;
        preHashed[39] = 0x75786645d0c5dd7c04a2f8a75dcae085213652f5bce3ea8b9b9bedd1cab3c5e9;
        preHashed[40] = 0xb88b152c9b8a7b79637d35911848b0c41e7cc7cca2ab4fe9a15f9c38bb4bb939;
        preHashed[41] = 0x0c4e2d8ce834ffd7a6cd85d7113d4521abb857774845c4291e6f6d010d97e318;
        preHashed[42] = 0x5bc799d83e3bb31501b3da786680df30fbc18eb41cbce611e8c0e9c72f69571c;
        preHashed[43] = 0xa10d3ef857d04d9c03ead7c6317d797a090fa1271ad9c7addfbcb412e9643d4f;
        preHashed[44] = 0xb33b1809c42623f474055fa9400a2027a7a885c8dfa4efe20666b4ee27d7529c;
        preHashed[45] = 0x134d7f28d53f175f6bf4b62faa2110d5b76f0f770c15e628181c1fcc18f970a9;
        preHashed[46] = 0xc34d24b2fc8c50ca9c07a7156ef4e5ff4bdf002eda0b11c1d359d0b59a546807;
        preHashed[47] = 0x04dbb9db631457879b27e0dfdbe50158fd9cf9b4cf77605c4ac4c95bd65fc9f6;
        preHashed[48] = 0xf9295a686647cb999090819cda700820c282c613cedcd218540bbc6f37b01c65;
    }
}
