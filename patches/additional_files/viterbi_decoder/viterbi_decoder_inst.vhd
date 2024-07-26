	component viterbi_decoder is
		port (
			clk            : in  std_logic                     := 'X';             -- clk
			sink_val       : in  std_logic                     := 'X';             -- valid
			sink_rdy       : out std_logic;                                        -- ready
			eras_sym       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- eras_sym
			rr             : in  std_logic_vector(15 downto 0) := (others => 'X'); -- rr
			source_val     : out std_logic;                                        -- valid
			source_rdy     : in  std_logic                     := 'X';             -- ready
			normalizations : out std_logic_vector(7 downto 0);                     -- normalizations
			decbit         : out std_logic;                                        -- decbit
			reset          : in  std_logic                     := 'X'              -- reset
		);
	end component viterbi_decoder;

	u0 : component viterbi_decoder
		port map (
			clk            => CONNECTED_TO_clk,            -- clk.clk
			sink_val       => CONNECTED_TO_sink_val,       --  in.valid
			sink_rdy       => CONNECTED_TO_sink_rdy,       --    .ready
			eras_sym       => CONNECTED_TO_eras_sym,       --    .eras_sym
			rr             => CONNECTED_TO_rr,             --    .rr
			source_val     => CONNECTED_TO_source_val,     -- out.valid
			source_rdy     => CONNECTED_TO_source_rdy,     --    .ready
			normalizations => CONNECTED_TO_normalizations, --    .normalizations
			decbit         => CONNECTED_TO_decbit,         --    .decbit
			reset          => CONNECTED_TO_reset           -- rst.reset
		);

