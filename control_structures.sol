// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Definisi custom error untuk fungsi doNotDisturb
error AfterHours(uint timeProvided);

contract ControlStructures {

    function fizzBuzz(uint _number) public pure returns (string memory) {
        // Cek kondisi paling spesifik terlebih dahulu: habis dibagi 3 dan 5
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } 
        // Cek kondisi habis dibagi 3
        else if (_number % 3 == 0) {
            return "Fizz";
        } 
        // Cek kondisi habis dibagi 5
        else if (_number % 5 == 0) {
            return "Buzz";
        } 
        // Jika tidak ada kondisi di atas yang terpenuhi
        else {
            return "Splat";
        }
    }

    function doNotDisturb(uint _time) public pure returns (string memory) {
        // Jika _time >= 2400, trigger panic (internal error)
        if (_time >= 2400) {
            assert(_time < 2400); 
        }

        // Jika _time > 2200 atau < 800, revert dengan custom error
        if (_time > 2200 || _time < 800) {
            revert AfterHours({ timeProvided: _time });
        }
        
        // Jika _time di antara 1200 dan 1259, revert dengan pesan
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }
        
        // Cek kondisi waktu lainnya
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }
        
        // Ini adalah fallback jika tidak ada kondisi yang terpenuhi,
        // meskipun logika di atas seharusnya sudah mencakup semua kemungkinan.
        return "";
    }
}
