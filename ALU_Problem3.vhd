library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU_Problem3 is
port(
	clock: in std_logic;
	A, B: in unsigned(7 downto 0);
	student_id: in unsigned (3 downto 0);
	op: in unsigned(15 downto 0);
	R1: out unsigned(3 downto 0));

end ALU_Problem3;

architecture calculation of ALU_Problem3 is
	SIGNAL Reg1, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL temp: integer;
	begin
		Reg1 <= A; --temp store A in reg1
		process(clock, op)
		begin
			if(rising_edge(clock)) then --if calc @ positive edge of clock cycle
				CASE OP IS
			WHEN "0000000000000001" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000000000010"  =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000000000100" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000000001000" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000000010000" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000000100000" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000001000000" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000010000000" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN "0000000100000000" =>
				if (Reg1(7 downto 4) < student_id) or (Reg1(3 downto 0) < student_id) then
					Result <= "00000001"; --Y
				else
					Result <= "00000000"; --N
				end if;
			WHEN OTHERS =>-- Don't care
				Result<= "--------";
			END CASE;
		END IF;
	END PROCESS;
	R1 <= Result(3 downto 0);
END calculation;