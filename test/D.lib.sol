/// SPDX-License-Identifier: MPL-2.0
pragma solidity ^0.8.4 <0.9.0;

// helpers to use with require(false, D.str_concat(D.to_ascii_....)

library D {
    function str_concat(string memory _a, string memory _b)
        internal
        pure
        returns (string memory _concatenatedString)
    {
        return str_concat(_a, _b, "", "", "", "", "", "");
    }

    function str_concat(
        string memory _a,
        string memory _b,
        string memory _c
    ) internal pure returns (string memory _concatenatedString) {
        return str_concat(_a, _b, _c, "", "");
    }

    function str_concat(
        string memory _a,
        string memory _b,
        string memory _c,
        string memory _d
    ) internal pure returns (string memory _concatenatedString) {
        return str_concat(_a, _b, _c, _d, "", "", "", "");
    }

    function str_concat(
        string memory _a,
        string memory _b,
        string memory _c,
        string memory _d,
        string memory _e
    ) internal pure returns (string memory _concatenatedString) {
        return str_concat(_a, _b, _c, _d, _e, "", "", "");
    }

    function str_concat(
        string memory _a,
        string memory _b,
        string memory _c,
        string memory _d,
        string memory _e,
        string memory _f
    ) internal pure returns (string memory _concatenatedString) {
        return str_concat(_a, _b, _c, _d, _e, _f, "", "");
    }

    function str_concat(
        string memory _a,
        string memory _b,
        string memory _c,
        string memory _d,
        string memory _e,
        string memory _f,
        string memory _g
    ) internal pure returns (string memory _concatenatedString) {
        return str_concat(_a, _b, _c, _d, _e, _f, _g, "");
    }

    function str_concat(
        string memory _a,
        string memory _b,
        string memory _c,
        string memory _d,
        string memory _e,
        string memory _f,
        string memory _g,
        string memory _h
    ) internal pure returns (string memory _concatenatedString) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        bytes memory _bf = bytes(_f);
        bytes memory _bg = bytes(_g);
        bytes memory _bh = bytes(_h);

        string memory abcdefgh = new string(
            _ba.length +
                _bb.length +
                _bc.length +
                _bd.length +
                _be.length +
                _bf.length +
                _bg.length +
                _bh.length
        );
        bytes memory babcde = bytes(abcdefgh);
        uint256 k = 0;
        uint256 i = 0;
        for (i = 0; i < _ba.length; i++) {
            babcde[k++] = _ba[i];
        }
        for (i = 0; i < _bb.length; i++) {
            babcde[k++] = _bb[i];
        }
        for (i = 0; i < _bc.length; i++) {
            babcde[k++] = _bc[i];
        }
        for (i = 0; i < _bd.length; i++) {
            babcde[k++] = _bd[i];
        }
        for (i = 0; i < _be.length; i++) {
            babcde[k++] = _be[i];
        }
        for (i = 0; i < _bf.length; i++) {
            babcde[k++] = _bf[i];
        }
        for (i = 0; i < _bg.length; i++) {
            babcde[k++] = _bg[i];
        }
        for (i = 0; i < _bh.length; i++) {
            babcde[k++] = _bh[i];
        }

        return string(babcde);
    }

    function int_to_string(uint256 _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + (_i % 10)));
            _i /= 10;
        }
        return str_concat(" ", string(bstr), " ");
    }

    function to_ascii_string(address x) internal pure returns (string memory) {
        bytes memory s = new bytes(40);
        for (uint256 i = 0; i < 20; i++) {
            bytes1 b = bytes1(uint8(uint256(uint160(x)) / (2**(8 * (19 - i)))));
            bytes1 hi = bytes1(uint8(b) / 16);
            bytes1 lo = bytes1(uint8(b) - 16 * uint8(hi));
            s[2 * i] = char(hi);
            s[2 * i + 1] = char(lo);
        }
        return str_concat("0x", string(s), " ");
    }

    function char(bytes1 b) internal pure returns (bytes1 c) {
        if (uint8(b) < 10) return bytes1(uint8(b) + 0x30);
        else return bytes1(uint8(b) + 0x57);
    }
}
