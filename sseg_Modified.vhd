LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg_Modified IS
PORT(
	bcd: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Cout: IN  STD_LOGIC;
	leds: OUT  STD_LOGIC_VECTOR(0 TO 6);
	negleds: OUT STD_LOGIC_VECTOR(0 TO 6));
END sseg_Modified;

ARCHITECTURE Behaviour OF sseg_Modified IS
BEGIN
PROCESS(bcd)
	BEGIN
		CASE bcd IS -- abcdefg
			WHEN "0000" => leds <= "1110110"; -- Y
			WHEN "0001" => leds <= "0110011"; -- N
			WHEN OTHERS => leds <= "-------";
		END CASE;
	END PROCESS;
PROCESS(Cout)
	BEGIN 
		CASE Cout IS
			WHEN	'0' => negleds <= "0000000";
			WHEN  '1' => negleds <= "0000001";
		END CASE;
	END PROCESS;
END Behaviour;

-- Unmodified ABCDEFG(non inverted)
	--WHEN "0000" => leds <= "1111110";
	--WHEN "0001" => leds <= "0110000";
	--WHEN "0010" => leds <= "1101101";
	--WHEN "0011" => leds <= "1111001";
	--WHEN "0100" => leds <= "0110011";
	--WHEN "0101" => leds <= "1011011";
	--WHEN "0110" => leds <= "1011111";
	--WHEN "0111" => leds <= "1110000";
	--WHEN "1000" => leds <= "1111111";
	--WHEN "1001" => leds <= "1110011";
	--WHEN OTHERS => leds <= "-------";
