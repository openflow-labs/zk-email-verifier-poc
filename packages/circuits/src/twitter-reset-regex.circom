pragma circom 2.1.5;

include "@zk-email/zk-regex-circom/circuits/regex_helpers.circom";

// regex: Referencia de pago:</span><br><span style=3D"font-fam=ily:&#39;Proxima Nova&#39;,_apple_system,&#39;Helvetica Neue&#39;,Helvetica=,Roboto,Arial,sans-serif;font-size:14px;color:rgba(0,0,0,0.8);font-weight:n=ormal;line-height:1.43;margin:0px;letter-spacing:-0.025px">[0-9]+
template TwitterResetRegex(msg_bytes) {
	signal input msg[msg_bytes];
	signal output out;

	var num_bytes = msg_bytes+1;
	signal in[num_bytes];
	in[0]<==255;
	for (var i = 0; i < msg_bytes; i++) {
		in[i+1] <== msg[i];
	}

	component eq[27][num_bytes];
	component and[29][num_bytes];
	component multi_or[3][num_bytes];
	signal states[num_bytes+1][27];
	signal states_tmp[num_bytes+1][27];
	signal from_zero_enabled[num_bytes+1];
	from_zero_enabled[num_bytes] <== 0;
	component state_changed[num_bytes];

	for (var i = 1; i < 27; i++) {
		states[0][i] <== 0;
	}

	for (var i = 0; i < num_bytes; i++) {
		state_changed[i] = MultiOR(26);
		states[i][0] <== 1;
		eq[0][i] = IsEqual();
		eq[0][i].in[0] <== in[i];
		eq[0][i].in[1] <== 82;
		and[0][i] = AND();
		and[0][i].a <== states[i][0];
		and[0][i].b <== eq[0][i].out;
		states_tmp[i+1][1] <== 0;
		eq[1][i] = IsEqual();
		eq[1][i].in[0] <== in[i];
		eq[1][i].in[1] <== 101;
		and[1][i] = AND();
		and[1][i].a <== states[i][1];
		and[1][i].b <== eq[1][i].out;
		states[i+1][2] <== and[1][i].out;
		eq[2][i] = IsEqual();
		eq[2][i].in[0] <== in[i];
		eq[2][i].in[1] <== 102;
		and[2][i] = AND();
		and[2][i].a <== states[i][2];
		and[2][i].b <== eq[2][i].out;
		states[i+1][3] <== and[2][i].out;
		and[3][i] = AND();
		and[3][i].a <== states[i][3];
		and[3][i].b <== eq[1][i].out;
		states[i+1][4] <== and[3][i].out;
		eq[3][i] = IsEqual();
		eq[3][i].in[0] <== in[i];
		eq[3][i].in[1] <== 114;
		and[4][i] = AND();
		and[4][i].a <== states[i][4];
		and[4][i].b <== eq[3][i].out;
		states[i+1][5] <== and[4][i].out;
		and[5][i] = AND();
		and[5][i].a <== states[i][5];
		and[5][i].b <== eq[1][i].out;
		states[i+1][6] <== and[5][i].out;
		eq[4][i] = IsEqual();
		eq[4][i].in[0] <== in[i];
		eq[4][i].in[1] <== 110;
		and[6][i] = AND();
		and[6][i].a <== states[i][6];
		and[6][i].b <== eq[4][i].out;
		states[i+1][7] <== and[6][i].out;
		eq[5][i] = IsEqual();
		eq[5][i].in[0] <== in[i];
		eq[5][i].in[1] <== 99;
		and[7][i] = AND();
		and[7][i].a <== states[i][7];
		and[7][i].b <== eq[5][i].out;
		states[i+1][8] <== and[7][i].out;
		eq[6][i] = IsEqual();
		eq[6][i].in[0] <== in[i];
		eq[6][i].in[1] <== 105;
		and[8][i] = AND();
		and[8][i].a <== states[i][8];
		and[8][i].b <== eq[6][i].out;
		states[i+1][9] <== and[8][i].out;
		eq[7][i] = IsEqual();
		eq[7][i].in[0] <== in[i];
		eq[7][i].in[1] <== 97;
		and[9][i] = AND();
		and[9][i].a <== states[i][9];
		and[9][i].b <== eq[7][i].out;
		states[i+1][10] <== and[9][i].out;
		eq[8][i] = IsEqual();
		eq[8][i].in[0] <== in[i];
		eq[8][i].in[1] <== 32;
		and[10][i] = AND();
		and[10][i].a <== states[i][10];
		and[10][i].b <== eq[8][i].out;
		states[i+1][11] <== and[10][i].out;
		eq[9][i] = IsEqual();
		eq[9][i].in[0] <== in[i];
		eq[9][i].in[1] <== 100;
		and[11][i] = AND();
		and[11][i].a <== states[i][11];
		and[11][i].b <== eq[9][i].out;
		states[i+1][12] <== and[11][i].out;
		and[12][i] = AND();
		and[12][i].a <== states[i][12];
		and[12][i].b <== eq[1][i].out;
		states[i+1][13] <== and[12][i].out;
		and[13][i] = AND();
		and[13][i].a <== states[i][13];
		and[13][i].b <== eq[8][i].out;
		states[i+1][14] <== and[13][i].out;
		eq[10][i] = IsEqual();
		eq[10][i].in[0] <== in[i];
		eq[10][i].in[1] <== 112;
		and[14][i] = AND();
		and[14][i].a <== states[i][14];
		and[14][i].b <== eq[10][i].out;
		states[i+1][15] <== and[14][i].out;
		and[15][i] = AND();
		and[15][i].a <== states[i][15];
		and[15][i].b <== eq[7][i].out;
		states[i+1][16] <== and[15][i].out;
		eq[11][i] = IsEqual();
		eq[11][i].in[0] <== in[i];
		eq[11][i].in[1] <== 103;
		and[16][i] = AND();
		and[16][i].a <== states[i][16];
		and[16][i].b <== eq[11][i].out;
		states[i+1][17] <== and[16][i].out;
		eq[12][i] = IsEqual();
		eq[12][i].in[0] <== in[i];
		eq[12][i].in[1] <== 111;
		and[17][i] = AND();
		and[17][i].a <== states[i][17];
		and[17][i].b <== eq[12][i].out;
		states[i+1][18] <== and[17][i].out;
		eq[13][i] = IsEqual();
		eq[13][i].in[0] <== in[i];
		eq[13][i].in[1] <== 58;
		and[18][i] = AND();
		and[18][i].a <== states[i][18];
		and[18][i].b <== eq[13][i].out;
		states[i+1][19] <== and[18][i].out;
		eq[14][i] = IsEqual();
		eq[14][i].in[0] <== in[i];
		eq[14][i].in[1] <== 13;
		and[19][i] = AND();
		and[19][i].a <== states[i][19];
		and[19][i].b <== eq[14][i].out;
		states[i+1][20] <== and[19][i].out;
		eq[15][i] = IsEqual();
		eq[15][i].in[0] <== in[i];
		eq[15][i].in[1] <== 10;
		and[20][i] = AND();
		and[20][i].a <== states[i][20];
		and[20][i].b <== eq[15][i].out;
		states[i+1][21] <== and[20][i].out;
		eq[16][i] = IsEqual();
		eq[16][i].in[0] <== in[i];
		eq[16][i].in[1] <== 48;
		eq[17][i] = IsEqual();
		eq[17][i].in[0] <== in[i];
		eq[17][i].in[1] <== 49;
		eq[18][i] = IsEqual();
		eq[18][i].in[0] <== in[i];
		eq[18][i].in[1] <== 50;
		eq[19][i] = IsEqual();
		eq[19][i].in[0] <== in[i];
		eq[19][i].in[1] <== 51;
		eq[20][i] = IsEqual();
		eq[20][i].in[0] <== in[i];
		eq[20][i].in[1] <== 52;
		eq[21][i] = IsEqual();
		eq[21][i].in[0] <== in[i];
		eq[21][i].in[1] <== 53;
		eq[22][i] = IsEqual();
		eq[22][i].in[0] <== in[i];
		eq[22][i].in[1] <== 54;
		eq[23][i] = IsEqual();
		eq[23][i].in[0] <== in[i];
		eq[23][i].in[1] <== 55;
		eq[24][i] = IsEqual();
		eq[24][i].in[0] <== in[i];
		eq[24][i].in[1] <== 56;
		eq[25][i] = IsEqual();
		eq[25][i].in[0] <== in[i];
		eq[25][i].in[1] <== 57;
		and[21][i] = AND();
		and[21][i].a <== states[i][21];
		multi_or[0][i] = MultiOR(11);
		multi_or[0][i].in[0] <== eq[8][i].out;
		multi_or[0][i].in[1] <== eq[16][i].out;
		multi_or[0][i].in[2] <== eq[17][i].out;
		multi_or[0][i].in[3] <== eq[18][i].out;
		multi_or[0][i].in[4] <== eq[19][i].out;
		multi_or[0][i].in[5] <== eq[20][i].out;
		multi_or[0][i].in[6] <== eq[21][i].out;
		multi_or[0][i].in[7] <== eq[22][i].out;
		multi_or[0][i].in[8] <== eq[23][i].out;
		multi_or[0][i].in[9] <== eq[24][i].out;
		multi_or[0][i].in[10] <== eq[25][i].out;
		and[21][i].b <== multi_or[0][i].out;
		and[22][i] = AND();
		and[22][i].a <== states[i][22];
		and[22][i].b <== multi_or[0][i].out;
		and[23][i] = AND();
		and[23][i].a <== states[i][24];
		and[23][i].b <== eq[15][i].out;
		multi_or[1][i] = MultiOR(3);
		multi_or[1][i].in[0] <== and[21][i].out;
		multi_or[1][i].in[1] <== and[22][i].out;
		multi_or[1][i].in[2] <== and[23][i].out;
		states[i+1][22] <== multi_or[1][i].out;
		eq[26][i] = IsEqual();
		eq[26][i].in[0] <== in[i];
		eq[26][i].in[1] <== 61;
		and[24][i] = AND();
		and[24][i].a <== states[i][21];
		and[24][i].b <== eq[26][i].out;
		and[25][i] = AND();
		and[25][i].a <== states[i][22];
		and[25][i].b <== eq[26][i].out;
		multi_or[2][i] = MultiOR(2);
		multi_or[2][i].in[0] <== and[24][i].out;
		multi_or[2][i].in[1] <== and[25][i].out;
		states[i+1][23] <== multi_or[2][i].out;
		and[26][i] = AND();
		and[26][i].a <== states[i][23];
		and[26][i].b <== eq[14][i].out;
		states[i+1][24] <== and[26][i].out;
		and[27][i] = AND();
		and[27][i].a <== states[i][22];
		and[27][i].b <== eq[14][i].out;
		states[i+1][25] <== and[27][i].out;
		and[28][i] = AND();
		and[28][i].a <== states[i][25];
		and[28][i].b <== eq[15][i].out;
		states[i+1][26] <== and[28][i].out;
		from_zero_enabled[i] <== MultiNOR(26)([states_tmp[i+1][1], states[i+1][2], states[i+1][3], states[i+1][4], states[i+1][5], states[i+1][6], states[i+1][7], states[i+1][8], states[i+1][9], states[i+1][10], states[i+1][11], states[i+1][12], states[i+1][13], states[i+1][14], states[i+1][15], states[i+1][16], states[i+1][17], states[i+1][18], states[i+1][19], states[i+1][20], states[i+1][21], states[i+1][22], states[i+1][23], states[i+1][24], states[i+1][25], states[i+1][26]]);
		states[i+1][1] <== MultiOR(2)([states_tmp[i+1][1], from_zero_enabled[i] * and[0][i].out]);
		state_changed[i].in[0] <== states[i+1][1];
		state_changed[i].in[1] <== states[i+1][2];
		state_changed[i].in[2] <== states[i+1][3];
		state_changed[i].in[3] <== states[i+1][4];
		state_changed[i].in[4] <== states[i+1][5];
		state_changed[i].in[5] <== states[i+1][6];
		state_changed[i].in[6] <== states[i+1][7];
		state_changed[i].in[7] <== states[i+1][8];
		state_changed[i].in[8] <== states[i+1][9];
		state_changed[i].in[9] <== states[i+1][10];
		state_changed[i].in[10] <== states[i+1][11];
		state_changed[i].in[11] <== states[i+1][12];
		state_changed[i].in[12] <== states[i+1][13];
		state_changed[i].in[13] <== states[i+1][14];
		state_changed[i].in[14] <== states[i+1][15];
		state_changed[i].in[15] <== states[i+1][16];
		state_changed[i].in[16] <== states[i+1][17];
		state_changed[i].in[17] <== states[i+1][18];
		state_changed[i].in[18] <== states[i+1][19];
		state_changed[i].in[19] <== states[i+1][20];
		state_changed[i].in[20] <== states[i+1][21];
		state_changed[i].in[21] <== states[i+1][22];
		state_changed[i].in[22] <== states[i+1][23];
		state_changed[i].in[23] <== states[i+1][24];
		state_changed[i].in[24] <== states[i+1][25];
		state_changed[i].in[25] <== states[i+1][26];
	}

	component is_accepted = MultiOR(num_bytes+1);
	for (var i = 0; i <= num_bytes; i++) {
		is_accepted.in[i] <== states[i][26];
	}
	out <== is_accepted.out;
	signal is_consecutive[msg_bytes+1][2];
	is_consecutive[msg_bytes][1] <== 1;
	for (var i = 0; i < msg_bytes; i++) {
		is_consecutive[msg_bytes-1-i][0] <== states[num_bytes-i][1] * (1 - is_consecutive[msg_bytes-i][1]) + is_consecutive[msg_bytes-i][1];
		is_consecutive[msg_bytes-1-i][1] <== state_changed[msg_bytes-i].out * is_consecutive[msg_bytes-1-i][0];
	}
	signal is_substr0[msg_bytes][3];
	signal is_reveal0[msg_bytes];
	signal output reveal0[msg_bytes];
	for (var i = 0; i < msg_bytes; i++) {
		is_substr0[i][0] <== 0;
		is_substr0[i][1] <== is_substr0[i][0] + states[i+1][1] * states[i+2][1];
		is_substr0[i][2] <== is_substr0[i][1] + states[i+1][22] * states[i+2][1];
		is_reveal0[i] <== is_substr0[i][2] * is_consecutive[i][1];
		reveal0[i] <== in[i+1] * is_reveal0[i];
	}
}