library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
port(
	clock: in std_logic;
	A, B: in unsigned(7 downto 0);
	student_id: in unsigned (3 downto 0);
	op: in unsigned(15 downto 0);
	carry, neg: out std_logic;
	R1: out unsigned(3 downto 0); --first 4bits from 8bit
	R2: out unsigned(3 downto 0)); --other 4bits from 8bit
end ALU;

architecture calculation of ALU is
	signal reg1, reg2, result: unsigned(7 downto 0) := (others => '0');
	signal temp: unsigned(8 downto 0) := (others => '0');
	begin
		Reg1 <= A; --temp store A in reg1
		Reg2 <= B; --temp store B in reg2
		process(clock, op)
		begin
			if(rising_edge(clock)) then --if calc @ positive edge of clock cycle
				CASE OP IS
			WHEN "0000000000000001" => --addition
				neg <= '0';
				Result <= Reg2 + Reg1;
			WHEN "0000000000000010"  => --subtraction
				if (Reg1 < Reg2) then
					neg <= '1';
					Result <= (Reg2 - Reg1);
				else
					neg <= '0';
					Result <= (Reg1 - Reg2);
				end if;
			WHEN "0000000000000100" =>--Inverse (NOT)
				neg <= '0';
				Result <= NOT(Reg1);
			WHEN "0000000000001000" =>--Boolean NAND
				neg <= '0';
				Result <= (Reg1 NAND Reg2);
			WHEN "0000000000010000" =>--Boolean NOR
				neg <= '0';
				Result <= (Reg1 NOR Reg2);
			WHEN "0000000000100000" =>--Boolean AND
				neg <= '0';
				Result <= (Reg1 AND Reg2);
			WHEN "0000000001000000" =>--Boolean OR
				neg <= '0';
				Result <= (Reg1 OR Reg2);
			WHEN "0000000010000000" =>--Boolean XOR
				neg <= '0';
				Result <= (Reg1 XOR Reg2);
			WHEN "0000000100000000" =>--Boolean XNOR
				neg <= '0';
				Result <= (Reg1 XNOR Reg2);
			WHEN OTHERS =>-- Don't care
			END CASE;
		END IF;
	END PROCESS;
	
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);

END calculation;