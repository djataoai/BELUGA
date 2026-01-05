(define
	(problem beluga-problem_103_s145_j266_r20_oc21_f173)
	(:domain beluga)
  (:objects
		; Numbers: {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 37, 38}
		n00 - num
		n01 - num
		n02 - num
		n03 - num
		n04 - num
		n05 - num
		n06 - num
		n07 - num
		n08 - num
		n09 - num
		n10 - num
		n11 - num
		n12 - num
		n13 - num
		n14 - num
		n15 - num
		n16 - num
		n17 - num
		n18 - num
		n19 - num
		n20 - num
		n21 - num
		n22 - num
		n23 - num
		n24 - num
		n25 - num
		n26 - num
		n27 - num
		n28 - num
		n29 - num
		n30 - num
		n31 - num
		n32 - num
		n33 - num
		n34 - num
		n35 - num
		n37 - num
		n38 - num
		; trailers:
		beluga_trailer_1 - trailer
		beluga_trailer_2 - trailer
		factory_trailer_1 - trailer
		factory_trailer_2 - trailer
		; Racks:
		rack00 - rack
		rack01 - rack
		rack02 - rack
		rack03 - rack
		rack04 - rack
		rack05 - rack
		rack06 - rack
		rack07 - rack
		rack08 - rack
		rack09 - rack
		rack10 - rack
		rack11 - rack
		rack12 - rack
		rack13 - rack
		rack14 - rack
		rack15 - rack
		rack16 - rack
		rack17 - rack
		rack18 - rack
		rack19 - rack
		; Jigs:
		jig0001 - jig
		jig0002 - jig
		jig0003 - jig
		jig0004 - jig
		jig0005 - jig
		jig0006 - jig
		jig0007 - jig
		jig0008 - jig
		jig0009 - jig
		jig0010 - jig
		jig0011 - jig
		jig0012 - jig
		jig0013 - jig
		jig0014 - jig
		jig0015 - jig
		jig0016 - jig
		jig0017 - jig
		jig0018 - jig
		jig0019 - jig
		jig0020 - jig
		jig0021 - jig
		jig0022 - jig
		jig0023 - jig
		jig0024 - jig
		jig0025 - jig
		jig0026 - jig
		jig0027 - jig
		jig0028 - jig
		jig0029 - jig
		jig0030 - jig
		jig0031 - jig
		jig0032 - jig
		jig0033 - jig
		jig0034 - jig
		jig0035 - jig
		jig0036 - jig
		jig0037 - jig
		jig0038 - jig
		jig0039 - jig
		jig0040 - jig
		jig0041 - jig
		jig0042 - jig
		jig0043 - jig
		jig0044 - jig
		jig0045 - jig
		jig0046 - jig
		jig0047 - jig
		jig0048 - jig
		jig0049 - jig
		jig0050 - jig
		jig0051 - jig
		jig0052 - jig
		jig0053 - jig
		jig0054 - jig
		jig0055 - jig
		jig0056 - jig
		jig0057 - jig
		jig0058 - jig
		jig0059 - jig
		jig0060 - jig
		jig0061 - jig
		jig0062 - jig
		jig0063 - jig
		jig0064 - jig
		jig0065 - jig
		jig0066 - jig
		jig0067 - jig
		jig0068 - jig
		jig0069 - jig
		jig0070 - jig
		jig0071 - jig
		jig0072 - jig
		jig0073 - jig
		jig0074 - jig
		jig0075 - jig
		jig0076 - jig
		jig0077 - jig
		jig0078 - jig
		jig0079 - jig
		jig0080 - jig
		jig0081 - jig
		jig0082 - jig
		jig0083 - jig
		jig0084 - jig
		jig0085 - jig
		jig0086 - jig
		jig0087 - jig
		jig0088 - jig
		jig0089 - jig
		jig0090 - jig
		jig0091 - jig
		jig0092 - jig
		jig0093 - jig
		jig0094 - jig
		jig0095 - jig
		jig0096 - jig
		jig0097 - jig
		jig0098 - jig
		jig0099 - jig
		jig0100 - jig
		jig0101 - jig
		jig0102 - jig
		jig0103 - jig
		jig0104 - jig
		jig0105 - jig
		jig0106 - jig
		jig0107 - jig
		jig0108 - jig
		jig0109 - jig
		jig0110 - jig
		jig0111 - jig
		jig0112 - jig
		jig0113 - jig
		jig0114 - jig
		jig0115 - jig
		jig0116 - jig
		jig0117 - jig
		jig0118 - jig
		jig0119 - jig
		jig0120 - jig
		jig0121 - jig
		jig0122 - jig
		jig0123 - jig
		jig0124 - jig
		jig0125 - jig
		jig0126 - jig
		jig0127 - jig
		jig0128 - jig
		jig0129 - jig
		jig0130 - jig
		jig0131 - jig
		jig0132 - jig
		jig0133 - jig
		jig0134 - jig
		jig0135 - jig
		jig0136 - jig
		jig0137 - jig
		jig0138 - jig
		jig0139 - jig
		jig0140 - jig
		jig0141 - jig
		jig0142 - jig
		jig0143 - jig
		jig0144 - jig
		jig0145 - jig
		jig0146 - jig
		jig0147 - jig
		jig0148 - jig
		jig0149 - jig
		jig0150 - jig
		jig0151 - jig
		jig0152 - jig
		jig0153 - jig
		jig0154 - jig
		jig0155 - jig
		jig0156 - jig
		jig0157 - jig
		jig0158 - jig
		jig0159 - jig
		jig0160 - jig
		jig0161 - jig
		jig0162 - jig
		jig0163 - jig
		jig0164 - jig
		jig0165 - jig
		jig0166 - jig
		jig0167 - jig
		jig0168 - jig
		jig0169 - jig
		jig0170 - jig
		jig0171 - jig
		jig0172 - jig
		jig0173 - jig
		jig0174 - jig
		jig0175 - jig
		jig0176 - jig
		jig0177 - jig
		jig0178 - jig
		jig0179 - jig
		jig0180 - jig
		jig0181 - jig
		jig0182 - jig
		jig0183 - jig
		jig0184 - jig
		jig0185 - jig
		jig0186 - jig
		jig0187 - jig
		jig0188 - jig
		jig0189 - jig
		jig0190 - jig
		jig0191 - jig
		jig0192 - jig
		jig0193 - jig
		jig0194 - jig
		jig0195 - jig
		jig0196 - jig
		jig0197 - jig
		jig0198 - jig
		jig0199 - jig
		jig0200 - jig
		jig0201 - jig
		jig0202 - jig
		jig0203 - jig
		jig0204 - jig
		jig0205 - jig
		jig0206 - jig
		jig0207 - jig
		jig0208 - jig
		jig0209 - jig
		jig0210 - jig
		jig0211 - jig
		jig0212 - jig
		jig0213 - jig
		jig0214 - jig
		jig0215 - jig
		jig0216 - jig
		jig0217 - jig
		jig0218 - jig
		jig0219 - jig
		jig0220 - jig
		jig0221 - jig
		jig0222 - jig
		jig0223 - jig
		jig0224 - jig
		jig0225 - jig
		jig0226 - jig
		jig0227 - jig
		jig0228 - jig
		jig0229 - jig
		jig0230 - jig
		jig0231 - jig
		jig0232 - jig
		jig0233 - jig
		jig0234 - jig
		jig0235 - jig
		jig0236 - jig
		jig0237 - jig
		jig0238 - jig
		jig0239 - jig
		jig0240 - jig
		jig0241 - jig
		jig0242 - jig
		jig0243 - jig
		jig0244 - jig
		jig0245 - jig
		jig0246 - jig
		jig0247 - jig
		jig0248 - jig
		jig0249 - jig
		jig0250 - jig
		jig0251 - jig
		jig0252 - jig
		jig0253 - jig
		jig0254 - jig
		jig0255 - jig
		jig0256 - jig
		jig0257 - jig
		jig0258 - jig
		jig0259 - jig
		jig0260 - jig
		jig0261 - jig
		jig0262 - jig
		jig0263 - jig
		jig0264 - jig
		jig0265 - jig
		jig0266 - jig
		typeE - type
		typeD - type
		typeC - type
		typeB - type
		typeA - type
		; hangars:
		hangar1 - hangar
		hangar2 - hangar
		hangar3 - hangar
		; Beluga flights:
		beluga1 - beluga
		beluga2 - beluga
		beluga3 - beluga
		beluga4 - beluga
		beluga5 - beluga
		beluga6 - beluga
		beluga7 - beluga
		beluga8 - beluga
		beluga9 - beluga
		beluga10 - beluga
		beluga11 - beluga
		beluga12 - beluga
		beluga13 - beluga
		beluga14 - beluga
		beluga15 - beluga
		beluga16 - beluga
		beluga17 - beluga
		beluga18 - beluga
		beluga19 - beluga
		beluga20 - beluga
		beluga21 - beluga
		beluga22 - beluga
		beluga23 - beluga
		beluga24 - beluga
		beluga25 - beluga
		beluga26 - beluga
		beluga27 - beluga
		beluga28 - beluga
		beluga29 - beluga
		beluga30 - beluga
		beluga31 - beluga
		beluga32 - beluga
		beluga33 - beluga
		beluga34 - beluga
		beluga35 - beluga
		beluga36 - beluga
		beluga37 - beluga
		beluga38 - beluga
		beluga39 - beluga
		beluga40 - beluga
		beluga41 - beluga
		beluga42 - beluga
		beluga43 - beluga
		beluga44 - beluga
		beluga45 - beluga
		beluga46 - beluga
		beluga47 - beluga
		beluga48 - beluga
		beluga49 - beluga
		beluga50 - beluga
		beluga51 - beluga
		beluga52 - beluga
		beluga53 - beluga
		beluga54 - beluga
		beluga55 - beluga
		beluga56 - beluga
		beluga57 - beluga
		beluga58 - beluga
		beluga59 - beluga
		beluga60 - beluga
		beluga61 - beluga
		beluga62 - beluga
		beluga63 - beluga
		beluga64 - beluga
		beluga65 - beluga
		beluga66 - beluga
		beluga67 - beluga
		beluga68 - beluga
		beluga69 - beluga
		beluga70 - beluga
		beluga71 - beluga
		beluga72 - beluga
		beluga73 - beluga
		beluga74 - beluga
		beluga75 - beluga
		beluga76 - beluga
		beluga77 - beluga
		beluga78 - beluga
		beluga79 - beluga
		beluga80 - beluga
		beluga81 - beluga
		beluga82 - beluga
		beluga83 - beluga
		beluga84 - beluga
		beluga85 - beluga
		beluga86 - beluga
		beluga87 - beluga
		beluga88 - beluga
		beluga89 - beluga
		beluga90 - beluga
		beluga91 - beluga
		beluga92 - beluga
		beluga93 - beluga
		beluga94 - beluga
		beluga95 - beluga
		beluga96 - beluga
		beluga97 - beluga
		beluga98 - beluga
		beluga99 - beluga
		beluga100 - beluga
		beluga101 - beluga
		beluga102 - beluga
		beluga103 - beluga
		beluga104 - beluga
		beluga105 - beluga
		beluga106 - beluga
		beluga107 - beluga
		beluga108 - beluga
		beluga109 - beluga
		beluga110 - beluga
		beluga111 - beluga
		beluga112 - beluga
		beluga113 - beluga
		beluga114 - beluga
		beluga115 - beluga
		beluga116 - beluga
		beluga117 - beluga
		beluga118 - beluga
		beluga119 - beluga
		beluga120 - beluga
		beluga121 - beluga
		beluga122 - beluga
		beluga123 - beluga
		beluga124 - beluga
		beluga125 - beluga
		beluga126 - beluga
		beluga127 - beluga
		beluga128 - beluga
		beluga129 - beluga
		beluga130 - beluga
		beluga131 - beluga
		beluga132 - beluga
		beluga133 - beluga
		beluga134 - beluga
		beluga135 - beluga
		beluga136 - beluga
		beluga137 - beluga
		beluga138 - beluga
		beluga139 - beluga
		beluga140 - beluga
		beluga141 - beluga
		beluga142 - beluga
		beluga143 - beluga
		beluga144 - beluga
		beluga145 - beluga
		beluga146 - beluga
		beluga147 - beluga
		beluga148 - beluga
		beluga149 - beluga
		beluga150 - beluga
		beluga151 - beluga
		beluga152 - beluga
		beluga153 - beluga
		beluga154 - beluga
		beluga155 - beluga
		beluga156 - beluga
		beluga157 - beluga
		beluga158 - beluga
		beluga159 - beluga
		beluga160 - beluga
		beluga161 - beluga
		beluga162 - beluga
		beluga163 - beluga
		beluga164 - beluga
		beluga165 - beluga
		beluga166 - beluga
		beluga167 - beluga
		beluga168 - beluga
		beluga169 - beluga
		beluga170 - beluga
		beluga171 - beluga
		beluga172 - beluga
		beluga173 - beluga
		; Slots for outgoing flights:
		slot0 - slot
		slot1 - slot
		slot2 - slot
		slot3 - slot
		slot4 - slot
		slot5 - slot
		; Production lines:
		pl0 - production-line
	)
  (:init
		; Number encoding
		; Sizes fitting rack: rack00
		(fit  n00  n04  n04 rack00)
		(fit  n01  n04  n05 rack00)
		(fit  n02  n04  n06 rack00)
		(fit  n03  n04  n07 rack00)
		(fit  n04  n04  n08 rack00)
		(fit  n00  n08  n08 rack00)
		(fit  n05  n04  n09 rack00)
		(fit  n01  n08  n09 rack00)
		(fit  n00  n09  n09 rack00)
		(fit  n06  n04  n10 rack00)
		(fit  n02  n08  n10 rack00)
		(fit  n01  n09  n10 rack00)
		(fit  n07  n04  n11 rack00)
		(fit  n03  n08  n11 rack00)
		(fit  n02  n09  n11 rack00)
		(fit  n00  n11  n11 rack00)
		(fit  n08  n04  n12 rack00)
		(fit  n04  n08  n12 rack00)
		(fit  n03  n09  n12 rack00)
		(fit  n01  n11  n12 rack00)
		(fit  n09  n04  n13 rack00)
		(fit  n05  n08  n13 rack00)
		(fit  n04  n09  n13 rack00)
		(fit  n02  n11  n13 rack00)
		(fit  n10  n04  n14 rack00)
		(fit  n06  n08  n14 rack00)
		(fit  n05  n09  n14 rack00)
		(fit  n03  n11  n14 rack00)
		(fit  n11  n04  n15 rack00)
		(fit  n07  n08  n15 rack00)
		(fit  n06  n09  n15 rack00)
		(fit  n04  n11  n15 rack00)
		(fit  n12  n04  n16 rack00)
		(fit  n08  n08  n16 rack00)
		(fit  n07  n09  n16 rack00)
		(fit  n05  n11  n16 rack00)
		(fit  n13  n04  n17 rack00)
		(fit  n09  n08  n17 rack00)
		(fit  n08  n09  n17 rack00)
		(fit  n06  n11  n17 rack00)
		(fit  n14  n04  n18 rack00)
		(fit  n10  n08  n18 rack00)
		(fit  n09  n09  n18 rack00)
		(fit  n07  n11  n18 rack00)
		(fit  n00  n18  n18 rack00)
		(fit  n15  n04  n19 rack00)
		(fit  n11  n08  n19 rack00)
		(fit  n10  n09  n19 rack00)
		(fit  n08  n11  n19 rack00)
		(fit  n01  n18  n19 rack00)
		(fit  n16  n04  n20 rack00)
		(fit  n12  n08  n20 rack00)
		(fit  n11  n09  n20 rack00)
		(fit  n09  n11  n20 rack00)
		(fit  n02  n18  n20 rack00)
		(fit  n17  n04  n21 rack00)
		(fit  n13  n08  n21 rack00)
		(fit  n12  n09  n21 rack00)
		(fit  n10  n11  n21 rack00)
		(fit  n03  n18  n21 rack00)
		(fit  n18  n04  n22 rack00)
		(fit  n14  n08  n22 rack00)
		(fit  n13  n09  n22 rack00)
		(fit  n11  n11  n22 rack00)
		(fit  n04  n18  n22 rack00)
		(fit  n19  n04  n23 rack00)
		(fit  n15  n08  n23 rack00)
		(fit  n14  n09  n23 rack00)
		(fit  n12  n11  n23 rack00)
		(fit  n05  n18  n23 rack00)
		(fit  n21  n04  n25 rack00)
		(fit  n17  n08  n25 rack00)
		(fit  n16  n09  n25 rack00)
		(fit  n14  n11  n25 rack00)
		(fit  n07  n18  n25 rack00)
		(fit  n00  n25  n25 rack00)
		(fit  n22  n04  n26 rack00)
		(fit  n18  n08  n26 rack00)
		(fit  n17  n09  n26 rack00)
		(fit  n15  n11  n26 rack00)
		(fit  n08  n18  n26 rack00)
		(fit  n01  n25  n26 rack00)
		(fit  n23  n04  n27 rack00)
		(fit  n19  n08  n27 rack00)
		(fit  n18  n09  n27 rack00)
		(fit  n16  n11  n27 rack00)
		(fit  n09  n18  n27 rack00)
		(fit  n02  n25  n27 rack00)
		(fit  n25  n04  n29 rack00)
		(fit  n21  n08  n29 rack00)
		(fit  n20  n09  n29 rack00)
		(fit  n18  n11  n29 rack00)
		(fit  n11  n18  n29 rack00)
		(fit  n04  n25  n29 rack00)
		(fit  n26  n04  n30 rack00)
		(fit  n22  n08  n30 rack00)
		(fit  n21  n09  n30 rack00)
		(fit  n19  n11  n30 rack00)
		(fit  n12  n18  n30 rack00)
		(fit  n05  n25  n30 rack00)
		(fit  n02  n32  n34 rack00)
		(fit  n30  n04  n34 rack00)
		(fit  n26  n08  n34 rack00)
		(fit  n25  n09  n34 rack00)
		(fit  n23  n11  n34 rack00)
		(fit  n16  n18  n34 rack00)
		(fit  n09  n25  n34 rack00)
		(fit  n06  n32  n38 rack00)
		(fit  n34  n04  n38 rack00)
		(fit  n30  n08  n38 rack00)
		(fit  n29  n09  n38 rack00)
		(fit  n27  n11  n38 rack00)
		(fit  n20  n18  n38 rack00)
		(fit  n13  n25  n38 rack00)
		; Sizes fitting rack: rack01
		(fit  n00  n04  n04 rack01)
		(fit  n01  n04  n05 rack01)
		(fit  n02  n04  n06 rack01)
		(fit  n03  n04  n07 rack01)
		(fit  n04  n04  n08 rack01)
		(fit  n00  n08  n08 rack01)
		(fit  n05  n04  n09 rack01)
		(fit  n01  n08  n09 rack01)
		(fit  n00  n09  n09 rack01)
		(fit  n06  n04  n10 rack01)
		(fit  n02  n08  n10 rack01)
		(fit  n01  n09  n10 rack01)
		(fit  n07  n04  n11 rack01)
		(fit  n03  n08  n11 rack01)
		(fit  n02  n09  n11 rack01)
		(fit  n00  n11  n11 rack01)
		(fit  n08  n04  n12 rack01)
		(fit  n04  n08  n12 rack01)
		(fit  n03  n09  n12 rack01)
		(fit  n01  n11  n12 rack01)
		(fit  n09  n04  n13 rack01)
		(fit  n05  n08  n13 rack01)
		(fit  n04  n09  n13 rack01)
		(fit  n02  n11  n13 rack01)
		(fit  n10  n04  n14 rack01)
		(fit  n06  n08  n14 rack01)
		(fit  n05  n09  n14 rack01)
		(fit  n03  n11  n14 rack01)
		(fit  n11  n04  n15 rack01)
		(fit  n07  n08  n15 rack01)
		(fit  n06  n09  n15 rack01)
		(fit  n04  n11  n15 rack01)
		(fit  n12  n04  n16 rack01)
		(fit  n08  n08  n16 rack01)
		(fit  n07  n09  n16 rack01)
		(fit  n05  n11  n16 rack01)
		(fit  n13  n04  n17 rack01)
		(fit  n09  n08  n17 rack01)
		(fit  n08  n09  n17 rack01)
		(fit  n06  n11  n17 rack01)
		(fit  n14  n04  n18 rack01)
		(fit  n10  n08  n18 rack01)
		(fit  n09  n09  n18 rack01)
		(fit  n07  n11  n18 rack01)
		(fit  n00  n18  n18 rack01)
		(fit  n15  n04  n19 rack01)
		(fit  n11  n08  n19 rack01)
		(fit  n10  n09  n19 rack01)
		(fit  n08  n11  n19 rack01)
		(fit  n01  n18  n19 rack01)
		(fit  n17  n04  n21 rack01)
		(fit  n13  n08  n21 rack01)
		(fit  n12  n09  n21 rack01)
		(fit  n10  n11  n21 rack01)
		(fit  n03  n18  n21 rack01)
		(fit  n18  n04  n22 rack01)
		(fit  n14  n08  n22 rack01)
		(fit  n13  n09  n22 rack01)
		(fit  n11  n11  n22 rack01)
		(fit  n04  n18  n22 rack01)
		(fit  n19  n04  n23 rack01)
		(fit  n15  n08  n23 rack01)
		(fit  n14  n09  n23 rack01)
		(fit  n12  n11  n23 rack01)
		(fit  n05  n18  n23 rack01)
		(fit  n21  n04  n25 rack01)
		(fit  n17  n08  n25 rack01)
		(fit  n16  n09  n25 rack01)
		(fit  n14  n11  n25 rack01)
		(fit  n07  n18  n25 rack01)
		(fit  n00  n25  n25 rack01)
		(fit  n22  n04  n26 rack01)
		(fit  n18  n08  n26 rack01)
		(fit  n17  n09  n26 rack01)
		(fit  n15  n11  n26 rack01)
		(fit  n08  n18  n26 rack01)
		(fit  n01  n25  n26 rack01)
		(fit  n26  n04  n30 rack01)
		(fit  n22  n08  n30 rack01)
		(fit  n21  n09  n30 rack01)
		(fit  n19  n11  n30 rack01)
		(fit  n12  n18  n30 rack01)
		(fit  n05  n25  n30 rack01)
		(fit  n02  n32  n34 rack01)
		(fit  n30  n04  n34 rack01)
		(fit  n26  n08  n34 rack01)
		(fit  n25  n09  n34 rack01)
		(fit  n23  n11  n34 rack01)
		(fit  n16  n18  n34 rack01)
		(fit  n09  n25  n34 rack01)
		; Sizes fitting rack: rack02
		(fit  n00  n04  n04 rack02)
		(fit  n01  n04  n05 rack02)
		(fit  n02  n04  n06 rack02)
		(fit  n03  n04  n07 rack02)
		(fit  n04  n04  n08 rack02)
		(fit  n00  n08  n08 rack02)
		(fit  n05  n04  n09 rack02)
		(fit  n01  n08  n09 rack02)
		(fit  n00  n09  n09 rack02)
		(fit  n06  n04  n10 rack02)
		(fit  n02  n08  n10 rack02)
		(fit  n01  n09  n10 rack02)
		(fit  n08  n04  n12 rack02)
		(fit  n04  n08  n12 rack02)
		(fit  n03  n09  n12 rack02)
		(fit  n01  n11  n12 rack02)
		(fit  n09  n04  n13 rack02)
		(fit  n05  n08  n13 rack02)
		(fit  n04  n09  n13 rack02)
		(fit  n02  n11  n13 rack02)
		(fit  n10  n04  n14 rack02)
		(fit  n06  n08  n14 rack02)
		(fit  n05  n09  n14 rack02)
		(fit  n03  n11  n14 rack02)
		(fit  n12  n04  n16 rack02)
		(fit  n08  n08  n16 rack02)
		(fit  n07  n09  n16 rack02)
		(fit  n05  n11  n16 rack02)
		(fit  n13  n04  n17 rack02)
		(fit  n09  n08  n17 rack02)
		(fit  n08  n09  n17 rack02)
		(fit  n06  n11  n17 rack02)
		(fit  n17  n04  n21 rack02)
		(fit  n13  n08  n21 rack02)
		(fit  n12  n09  n21 rack02)
		(fit  n10  n11  n21 rack02)
		(fit  n03  n18  n21 rack02)
		(fit  n21  n04  n25 rack02)
		(fit  n17  n08  n25 rack02)
		(fit  n16  n09  n25 rack02)
		(fit  n14  n11  n25 rack02)
		(fit  n07  n18  n25 rack02)
		(fit  n00  n25  n25 rack02)
		; Sizes fitting rack: rack03
		(fit  n00  n04  n04 rack03)
		(fit  n01  n04  n05 rack03)
		(fit  n02  n04  n06 rack03)
		(fit  n03  n04  n07 rack03)
		(fit  n04  n04  n08 rack03)
		(fit  n00  n08  n08 rack03)
		(fit  n05  n04  n09 rack03)
		(fit  n01  n08  n09 rack03)
		(fit  n00  n09  n09 rack03)
		(fit  n06  n04  n10 rack03)
		(fit  n02  n08  n10 rack03)
		(fit  n01  n09  n10 rack03)
		(fit  n07  n04  n11 rack03)
		(fit  n03  n08  n11 rack03)
		(fit  n02  n09  n11 rack03)
		(fit  n00  n11  n11 rack03)
		(fit  n08  n04  n12 rack03)
		(fit  n04  n08  n12 rack03)
		(fit  n03  n09  n12 rack03)
		(fit  n01  n11  n12 rack03)
		(fit  n09  n04  n13 rack03)
		(fit  n05  n08  n13 rack03)
		(fit  n04  n09  n13 rack03)
		(fit  n02  n11  n13 rack03)
		(fit  n10  n04  n14 rack03)
		(fit  n06  n08  n14 rack03)
		(fit  n05  n09  n14 rack03)
		(fit  n03  n11  n14 rack03)
		(fit  n11  n04  n15 rack03)
		(fit  n07  n08  n15 rack03)
		(fit  n06  n09  n15 rack03)
		(fit  n04  n11  n15 rack03)
		(fit  n12  n04  n16 rack03)
		(fit  n08  n08  n16 rack03)
		(fit  n07  n09  n16 rack03)
		(fit  n05  n11  n16 rack03)
		(fit  n13  n04  n17 rack03)
		(fit  n09  n08  n17 rack03)
		(fit  n08  n09  n17 rack03)
		(fit  n06  n11  n17 rack03)
		(fit  n14  n04  n18 rack03)
		(fit  n10  n08  n18 rack03)
		(fit  n09  n09  n18 rack03)
		(fit  n07  n11  n18 rack03)
		(fit  n00  n18  n18 rack03)
		(fit  n15  n04  n19 rack03)
		(fit  n11  n08  n19 rack03)
		(fit  n10  n09  n19 rack03)
		(fit  n08  n11  n19 rack03)
		(fit  n01  n18  n19 rack03)
		(fit  n16  n04  n20 rack03)
		(fit  n12  n08  n20 rack03)
		(fit  n11  n09  n20 rack03)
		(fit  n09  n11  n20 rack03)
		(fit  n02  n18  n20 rack03)
		(fit  n18  n04  n22 rack03)
		(fit  n14  n08  n22 rack03)
		(fit  n13  n09  n22 rack03)
		(fit  n11  n11  n22 rack03)
		(fit  n04  n18  n22 rack03)
		(fit  n19  n04  n23 rack03)
		(fit  n15  n08  n23 rack03)
		(fit  n14  n09  n23 rack03)
		(fit  n12  n11  n23 rack03)
		(fit  n05  n18  n23 rack03)
		(fit  n20  n04  n24 rack03)
		(fit  n16  n08  n24 rack03)
		(fit  n15  n09  n24 rack03)
		(fit  n13  n11  n24 rack03)
		(fit  n06  n18  n24 rack03)
		(fit  n22  n04  n26 rack03)
		(fit  n18  n08  n26 rack03)
		(fit  n17  n09  n26 rack03)
		(fit  n15  n11  n26 rack03)
		(fit  n08  n18  n26 rack03)
		(fit  n01  n25  n26 rack03)
		(fit  n23  n04  n27 rack03)
		(fit  n19  n08  n27 rack03)
		(fit  n18  n09  n27 rack03)
		(fit  n16  n11  n27 rack03)
		(fit  n09  n18  n27 rack03)
		(fit  n02  n25  n27 rack03)
		(fit  n27  n04  n31 rack03)
		(fit  n23  n08  n31 rack03)
		(fit  n22  n09  n31 rack03)
		(fit  n20  n11  n31 rack03)
		(fit  n13  n18  n31 rack03)
		(fit  n06  n25  n31 rack03)
		(fit  n03  n32  n35 rack03)
		(fit  n31  n04  n35 rack03)
		(fit  n27  n08  n35 rack03)
		(fit  n26  n09  n35 rack03)
		(fit  n24  n11  n35 rack03)
		(fit  n17  n18  n35 rack03)
		(fit  n10  n25  n35 rack03)
		; Sizes fitting rack: rack04
		(fit  n00  n04  n04 rack04)
		(fit  n01  n04  n05 rack04)
		(fit  n02  n04  n06 rack04)
		(fit  n03  n04  n07 rack04)
		(fit  n04  n04  n08 rack04)
		(fit  n00  n08  n08 rack04)
		(fit  n05  n04  n09 rack04)
		(fit  n01  n08  n09 rack04)
		(fit  n00  n09  n09 rack04)
		(fit  n06  n04  n10 rack04)
		(fit  n02  n08  n10 rack04)
		(fit  n01  n09  n10 rack04)
		(fit  n08  n04  n12 rack04)
		(fit  n04  n08  n12 rack04)
		(fit  n03  n09  n12 rack04)
		(fit  n01  n11  n12 rack04)
		(fit  n09  n04  n13 rack04)
		(fit  n05  n08  n13 rack04)
		(fit  n04  n09  n13 rack04)
		(fit  n02  n11  n13 rack04)
		(fit  n10  n04  n14 rack04)
		(fit  n06  n08  n14 rack04)
		(fit  n05  n09  n14 rack04)
		(fit  n03  n11  n14 rack04)
		(fit  n12  n04  n16 rack04)
		(fit  n08  n08  n16 rack04)
		(fit  n07  n09  n16 rack04)
		(fit  n05  n11  n16 rack04)
		(fit  n13  n04  n17 rack04)
		(fit  n09  n08  n17 rack04)
		(fit  n08  n09  n17 rack04)
		(fit  n06  n11  n17 rack04)
		(fit  n17  n04  n21 rack04)
		(fit  n13  n08  n21 rack04)
		(fit  n12  n09  n21 rack04)
		(fit  n10  n11  n21 rack04)
		(fit  n03  n18  n21 rack04)
		(fit  n21  n04  n25 rack04)
		(fit  n17  n08  n25 rack04)
		(fit  n16  n09  n25 rack04)
		(fit  n14  n11  n25 rack04)
		(fit  n07  n18  n25 rack04)
		(fit  n00  n25  n25 rack04)
		; Sizes fitting rack: rack05
		(fit  n00  n04  n04 rack05)
		(fit  n01  n04  n05 rack05)
		(fit  n02  n04  n06 rack05)
		(fit  n03  n04  n07 rack05)
		(fit  n04  n04  n08 rack05)
		(fit  n00  n08  n08 rack05)
		(fit  n05  n04  n09 rack05)
		(fit  n01  n08  n09 rack05)
		(fit  n00  n09  n09 rack05)
		(fit  n06  n04  n10 rack05)
		(fit  n02  n08  n10 rack05)
		(fit  n01  n09  n10 rack05)
		(fit  n07  n04  n11 rack05)
		(fit  n03  n08  n11 rack05)
		(fit  n02  n09  n11 rack05)
		(fit  n00  n11  n11 rack05)
		(fit  n08  n04  n12 rack05)
		(fit  n04  n08  n12 rack05)
		(fit  n03  n09  n12 rack05)
		(fit  n01  n11  n12 rack05)
		(fit  n09  n04  n13 rack05)
		(fit  n05  n08  n13 rack05)
		(fit  n04  n09  n13 rack05)
		(fit  n02  n11  n13 rack05)
		(fit  n10  n04  n14 rack05)
		(fit  n06  n08  n14 rack05)
		(fit  n05  n09  n14 rack05)
		(fit  n03  n11  n14 rack05)
		(fit  n11  n04  n15 rack05)
		(fit  n07  n08  n15 rack05)
		(fit  n06  n09  n15 rack05)
		(fit  n04  n11  n15 rack05)
		(fit  n12  n04  n16 rack05)
		(fit  n08  n08  n16 rack05)
		(fit  n07  n09  n16 rack05)
		(fit  n05  n11  n16 rack05)
		(fit  n13  n04  n17 rack05)
		(fit  n09  n08  n17 rack05)
		(fit  n08  n09  n17 rack05)
		(fit  n06  n11  n17 rack05)
		(fit  n14  n04  n18 rack05)
		(fit  n10  n08  n18 rack05)
		(fit  n09  n09  n18 rack05)
		(fit  n07  n11  n18 rack05)
		(fit  n00  n18  n18 rack05)
		(fit  n15  n04  n19 rack05)
		(fit  n11  n08  n19 rack05)
		(fit  n10  n09  n19 rack05)
		(fit  n08  n11  n19 rack05)
		(fit  n01  n18  n19 rack05)
		(fit  n16  n04  n20 rack05)
		(fit  n12  n08  n20 rack05)
		(fit  n11  n09  n20 rack05)
		(fit  n09  n11  n20 rack05)
		(fit  n02  n18  n20 rack05)
		(fit  n17  n04  n21 rack05)
		(fit  n13  n08  n21 rack05)
		(fit  n12  n09  n21 rack05)
		(fit  n10  n11  n21 rack05)
		(fit  n03  n18  n21 rack05)
		(fit  n18  n04  n22 rack05)
		(fit  n14  n08  n22 rack05)
		(fit  n13  n09  n22 rack05)
		(fit  n11  n11  n22 rack05)
		(fit  n04  n18  n22 rack05)
		(fit  n19  n04  n23 rack05)
		(fit  n15  n08  n23 rack05)
		(fit  n14  n09  n23 rack05)
		(fit  n12  n11  n23 rack05)
		(fit  n05  n18  n23 rack05)
		(fit  n21  n04  n25 rack05)
		(fit  n17  n08  n25 rack05)
		(fit  n16  n09  n25 rack05)
		(fit  n14  n11  n25 rack05)
		(fit  n07  n18  n25 rack05)
		(fit  n00  n25  n25 rack05)
		(fit  n22  n04  n26 rack05)
		(fit  n18  n08  n26 rack05)
		(fit  n17  n09  n26 rack05)
		(fit  n15  n11  n26 rack05)
		(fit  n08  n18  n26 rack05)
		(fit  n01  n25  n26 rack05)
		(fit  n23  n04  n27 rack05)
		(fit  n19  n08  n27 rack05)
		(fit  n18  n09  n27 rack05)
		(fit  n16  n11  n27 rack05)
		(fit  n09  n18  n27 rack05)
		(fit  n02  n25  n27 rack05)
		(fit  n25  n04  n29 rack05)
		(fit  n21  n08  n29 rack05)
		(fit  n20  n09  n29 rack05)
		(fit  n18  n11  n29 rack05)
		(fit  n11  n18  n29 rack05)
		(fit  n04  n25  n29 rack05)
		(fit  n26  n04  n30 rack05)
		(fit  n22  n08  n30 rack05)
		(fit  n21  n09  n30 rack05)
		(fit  n19  n11  n30 rack05)
		(fit  n12  n18  n30 rack05)
		(fit  n05  n25  n30 rack05)
		(fit  n02  n32  n34 rack05)
		(fit  n30  n04  n34 rack05)
		(fit  n26  n08  n34 rack05)
		(fit  n25  n09  n34 rack05)
		(fit  n23  n11  n34 rack05)
		(fit  n16  n18  n34 rack05)
		(fit  n09  n25  n34 rack05)
		(fit  n06  n32  n38 rack05)
		(fit  n34  n04  n38 rack05)
		(fit  n30  n08  n38 rack05)
		(fit  n29  n09  n38 rack05)
		(fit  n27  n11  n38 rack05)
		(fit  n20  n18  n38 rack05)
		(fit  n13  n25  n38 rack05)
		; Sizes fitting rack: rack06
		(fit  n00  n04  n04 rack06)
		(fit  n01  n04  n05 rack06)
		(fit  n02  n04  n06 rack06)
		(fit  n03  n04  n07 rack06)
		(fit  n04  n04  n08 rack06)
		(fit  n00  n08  n08 rack06)
		(fit  n05  n04  n09 rack06)
		(fit  n01  n08  n09 rack06)
		(fit  n00  n09  n09 rack06)
		(fit  n06  n04  n10 rack06)
		(fit  n02  n08  n10 rack06)
		(fit  n01  n09  n10 rack06)
		(fit  n07  n04  n11 rack06)
		(fit  n03  n08  n11 rack06)
		(fit  n02  n09  n11 rack06)
		(fit  n00  n11  n11 rack06)
		(fit  n09  n04  n13 rack06)
		(fit  n05  n08  n13 rack06)
		(fit  n04  n09  n13 rack06)
		(fit  n02  n11  n13 rack06)
		(fit  n10  n04  n14 rack06)
		(fit  n06  n08  n14 rack06)
		(fit  n05  n09  n14 rack06)
		(fit  n03  n11  n14 rack06)
		(fit  n11  n04  n15 rack06)
		(fit  n07  n08  n15 rack06)
		(fit  n06  n09  n15 rack06)
		(fit  n04  n11  n15 rack06)
		(fit  n13  n04  n17 rack06)
		(fit  n09  n08  n17 rack06)
		(fit  n08  n09  n17 rack06)
		(fit  n06  n11  n17 rack06)
		(fit  n14  n04  n18 rack06)
		(fit  n10  n08  n18 rack06)
		(fit  n09  n09  n18 rack06)
		(fit  n07  n11  n18 rack06)
		(fit  n00  n18  n18 rack06)
		(fit  n18  n04  n22 rack06)
		(fit  n14  n08  n22 rack06)
		(fit  n13  n09  n22 rack06)
		(fit  n11  n11  n22 rack06)
		(fit  n04  n18  n22 rack06)
		(fit  n22  n04  n26 rack06)
		(fit  n18  n08  n26 rack06)
		(fit  n17  n09  n26 rack06)
		(fit  n15  n11  n26 rack06)
		(fit  n08  n18  n26 rack06)
		(fit  n01  n25  n26 rack06)
		; Sizes fitting rack: rack07
		(fit  n00  n04  n04 rack07)
		(fit  n01  n04  n05 rack07)
		(fit  n02  n04  n06 rack07)
		(fit  n03  n04  n07 rack07)
		(fit  n04  n04  n08 rack07)
		(fit  n00  n08  n08 rack07)
		(fit  n05  n04  n09 rack07)
		(fit  n01  n08  n09 rack07)
		(fit  n00  n09  n09 rack07)
		(fit  n06  n04  n10 rack07)
		(fit  n02  n08  n10 rack07)
		(fit  n01  n09  n10 rack07)
		(fit  n07  n04  n11 rack07)
		(fit  n03  n08  n11 rack07)
		(fit  n02  n09  n11 rack07)
		(fit  n00  n11  n11 rack07)
		(fit  n08  n04  n12 rack07)
		(fit  n04  n08  n12 rack07)
		(fit  n03  n09  n12 rack07)
		(fit  n01  n11  n12 rack07)
		(fit  n09  n04  n13 rack07)
		(fit  n05  n08  n13 rack07)
		(fit  n04  n09  n13 rack07)
		(fit  n02  n11  n13 rack07)
		(fit  n10  n04  n14 rack07)
		(fit  n06  n08  n14 rack07)
		(fit  n05  n09  n14 rack07)
		(fit  n03  n11  n14 rack07)
		(fit  n12  n04  n16 rack07)
		(fit  n08  n08  n16 rack07)
		(fit  n07  n09  n16 rack07)
		(fit  n05  n11  n16 rack07)
		(fit  n13  n04  n17 rack07)
		(fit  n09  n08  n17 rack07)
		(fit  n08  n09  n17 rack07)
		(fit  n06  n11  n17 rack07)
		(fit  n14  n04  n18 rack07)
		(fit  n10  n08  n18 rack07)
		(fit  n09  n09  n18 rack07)
		(fit  n07  n11  n18 rack07)
		(fit  n00  n18  n18 rack07)
		(fit  n16  n04  n20 rack07)
		(fit  n12  n08  n20 rack07)
		(fit  n11  n09  n20 rack07)
		(fit  n09  n11  n20 rack07)
		(fit  n02  n18  n20 rack07)
		(fit  n17  n04  n21 rack07)
		(fit  n13  n08  n21 rack07)
		(fit  n12  n09  n21 rack07)
		(fit  n10  n11  n21 rack07)
		(fit  n03  n18  n21 rack07)
		(fit  n21  n04  n25 rack07)
		(fit  n17  n08  n25 rack07)
		(fit  n16  n09  n25 rack07)
		(fit  n14  n11  n25 rack07)
		(fit  n07  n18  n25 rack07)
		(fit  n00  n25  n25 rack07)
		(fit  n25  n04  n29 rack07)
		(fit  n21  n08  n29 rack07)
		(fit  n20  n09  n29 rack07)
		(fit  n18  n11  n29 rack07)
		(fit  n11  n18  n29 rack07)
		(fit  n04  n25  n29 rack07)
		; Sizes fitting rack: rack08
		(fit  n00  n04  n04 rack08)
		(fit  n01  n04  n05 rack08)
		(fit  n02  n04  n06 rack08)
		(fit  n03  n04  n07 rack08)
		(fit  n04  n04  n08 rack08)
		(fit  n00  n08  n08 rack08)
		(fit  n05  n04  n09 rack08)
		(fit  n01  n08  n09 rack08)
		(fit  n00  n09  n09 rack08)
		(fit  n06  n04  n10 rack08)
		(fit  n02  n08  n10 rack08)
		(fit  n01  n09  n10 rack08)
		(fit  n07  n04  n11 rack08)
		(fit  n03  n08  n11 rack08)
		(fit  n02  n09  n11 rack08)
		(fit  n00  n11  n11 rack08)
		(fit  n09  n04  n13 rack08)
		(fit  n05  n08  n13 rack08)
		(fit  n04  n09  n13 rack08)
		(fit  n02  n11  n13 rack08)
		(fit  n10  n04  n14 rack08)
		(fit  n06  n08  n14 rack08)
		(fit  n05  n09  n14 rack08)
		(fit  n03  n11  n14 rack08)
		(fit  n11  n04  n15 rack08)
		(fit  n07  n08  n15 rack08)
		(fit  n06  n09  n15 rack08)
		(fit  n04  n11  n15 rack08)
		(fit  n13  n04  n17 rack08)
		(fit  n09  n08  n17 rack08)
		(fit  n08  n09  n17 rack08)
		(fit  n06  n11  n17 rack08)
		(fit  n14  n04  n18 rack08)
		(fit  n10  n08  n18 rack08)
		(fit  n09  n09  n18 rack08)
		(fit  n07  n11  n18 rack08)
		(fit  n00  n18  n18 rack08)
		(fit  n18  n04  n22 rack08)
		(fit  n14  n08  n22 rack08)
		(fit  n13  n09  n22 rack08)
		(fit  n11  n11  n22 rack08)
		(fit  n04  n18  n22 rack08)
		(fit  n22  n04  n26 rack08)
		(fit  n18  n08  n26 rack08)
		(fit  n17  n09  n26 rack08)
		(fit  n15  n11  n26 rack08)
		(fit  n08  n18  n26 rack08)
		(fit  n01  n25  n26 rack08)
		; Sizes fitting rack: rack09
		(fit  n00  n04  n04 rack09)
		(fit  n01  n04  n05 rack09)
		(fit  n02  n04  n06 rack09)
		(fit  n03  n04  n07 rack09)
		(fit  n04  n04  n08 rack09)
		(fit  n00  n08  n08 rack09)
		(fit  n05  n04  n09 rack09)
		(fit  n01  n08  n09 rack09)
		(fit  n00  n09  n09 rack09)
		(fit  n06  n04  n10 rack09)
		(fit  n02  n08  n10 rack09)
		(fit  n01  n09  n10 rack09)
		(fit  n07  n04  n11 rack09)
		(fit  n03  n08  n11 rack09)
		(fit  n02  n09  n11 rack09)
		(fit  n00  n11  n11 rack09)
		(fit  n08  n04  n12 rack09)
		(fit  n04  n08  n12 rack09)
		(fit  n03  n09  n12 rack09)
		(fit  n01  n11  n12 rack09)
		(fit  n09  n04  n13 rack09)
		(fit  n05  n08  n13 rack09)
		(fit  n04  n09  n13 rack09)
		(fit  n02  n11  n13 rack09)
		(fit  n10  n04  n14 rack09)
		(fit  n06  n08  n14 rack09)
		(fit  n05  n09  n14 rack09)
		(fit  n03  n11  n14 rack09)
		(fit  n11  n04  n15 rack09)
		(fit  n07  n08  n15 rack09)
		(fit  n06  n09  n15 rack09)
		(fit  n04  n11  n15 rack09)
		(fit  n12  n04  n16 rack09)
		(fit  n08  n08  n16 rack09)
		(fit  n07  n09  n16 rack09)
		(fit  n05  n11  n16 rack09)
		(fit  n13  n04  n17 rack09)
		(fit  n09  n08  n17 rack09)
		(fit  n08  n09  n17 rack09)
		(fit  n06  n11  n17 rack09)
		(fit  n14  n04  n18 rack09)
		(fit  n10  n08  n18 rack09)
		(fit  n09  n09  n18 rack09)
		(fit  n07  n11  n18 rack09)
		(fit  n00  n18  n18 rack09)
		(fit  n16  n04  n20 rack09)
		(fit  n12  n08  n20 rack09)
		(fit  n11  n09  n20 rack09)
		(fit  n09  n11  n20 rack09)
		(fit  n02  n18  n20 rack09)
		(fit  n17  n04  n21 rack09)
		(fit  n13  n08  n21 rack09)
		(fit  n12  n09  n21 rack09)
		(fit  n10  n11  n21 rack09)
		(fit  n03  n18  n21 rack09)
		(fit  n18  n04  n22 rack09)
		(fit  n14  n08  n22 rack09)
		(fit  n13  n09  n22 rack09)
		(fit  n11  n11  n22 rack09)
		(fit  n04  n18  n22 rack09)
		(fit  n20  n04  n24 rack09)
		(fit  n16  n08  n24 rack09)
		(fit  n15  n09  n24 rack09)
		(fit  n13  n11  n24 rack09)
		(fit  n06  n18  n24 rack09)
		(fit  n21  n04  n25 rack09)
		(fit  n17  n08  n25 rack09)
		(fit  n16  n09  n25 rack09)
		(fit  n14  n11  n25 rack09)
		(fit  n07  n18  n25 rack09)
		(fit  n00  n25  n25 rack09)
		(fit  n25  n04  n29 rack09)
		(fit  n21  n08  n29 rack09)
		(fit  n20  n09  n29 rack09)
		(fit  n18  n11  n29 rack09)
		(fit  n11  n18  n29 rack09)
		(fit  n04  n25  n29 rack09)
		(fit  n01  n32  n33 rack09)
		(fit  n29  n04  n33 rack09)
		(fit  n25  n08  n33 rack09)
		(fit  n24  n09  n33 rack09)
		(fit  n22  n11  n33 rack09)
		(fit  n15  n18  n33 rack09)
		(fit  n08  n25  n33 rack09)
		; Sizes fitting rack: rack10
		(fit  n00  n04  n04 rack10)
		(fit  n01  n04  n05 rack10)
		(fit  n03  n04  n07 rack10)
		(fit  n04  n04  n08 rack10)
		(fit  n00  n08  n08 rack10)
		(fit  n05  n04  n09 rack10)
		(fit  n01  n08  n09 rack10)
		(fit  n00  n09  n09 rack10)
		(fit  n07  n04  n11 rack10)
		(fit  n03  n08  n11 rack10)
		(fit  n02  n09  n11 rack10)
		(fit  n00  n11  n11 rack10)
		(fit  n08  n04  n12 rack10)
		(fit  n04  n08  n12 rack10)
		(fit  n03  n09  n12 rack10)
		(fit  n01  n11  n12 rack10)
		(fit  n12  n04  n16 rack10)
		(fit  n08  n08  n16 rack10)
		(fit  n07  n09  n16 rack10)
		(fit  n05  n11  n16 rack10)
		(fit  n16  n04  n20 rack10)
		(fit  n12  n08  n20 rack10)
		(fit  n11  n09  n20 rack10)
		(fit  n09  n11  n20 rack10)
		(fit  n02  n18  n20 rack10)
		; Sizes fitting rack: rack11
		(fit  n00  n04  n04 rack11)
		(fit  n01  n04  n05 rack11)
		(fit  n02  n04  n06 rack11)
		(fit  n03  n04  n07 rack11)
		(fit  n04  n04  n08 rack11)
		(fit  n00  n08  n08 rack11)
		(fit  n05  n04  n09 rack11)
		(fit  n01  n08  n09 rack11)
		(fit  n00  n09  n09 rack11)
		(fit  n06  n04  n10 rack11)
		(fit  n02  n08  n10 rack11)
		(fit  n01  n09  n10 rack11)
		(fit  n07  n04  n11 rack11)
		(fit  n03  n08  n11 rack11)
		(fit  n02  n09  n11 rack11)
		(fit  n00  n11  n11 rack11)
		(fit  n08  n04  n12 rack11)
		(fit  n04  n08  n12 rack11)
		(fit  n03  n09  n12 rack11)
		(fit  n01  n11  n12 rack11)
		(fit  n09  n04  n13 rack11)
		(fit  n05  n08  n13 rack11)
		(fit  n04  n09  n13 rack11)
		(fit  n02  n11  n13 rack11)
		(fit  n10  n04  n14 rack11)
		(fit  n06  n08  n14 rack11)
		(fit  n05  n09  n14 rack11)
		(fit  n03  n11  n14 rack11)
		(fit  n11  n04  n15 rack11)
		(fit  n07  n08  n15 rack11)
		(fit  n06  n09  n15 rack11)
		(fit  n04  n11  n15 rack11)
		(fit  n13  n04  n17 rack11)
		(fit  n09  n08  n17 rack11)
		(fit  n08  n09  n17 rack11)
		(fit  n06  n11  n17 rack11)
		(fit  n14  n04  n18 rack11)
		(fit  n10  n08  n18 rack11)
		(fit  n09  n09  n18 rack11)
		(fit  n07  n11  n18 rack11)
		(fit  n00  n18  n18 rack11)
		(fit  n15  n04  n19 rack11)
		(fit  n11  n08  n19 rack11)
		(fit  n10  n09  n19 rack11)
		(fit  n08  n11  n19 rack11)
		(fit  n01  n18  n19 rack11)
		(fit  n17  n04  n21 rack11)
		(fit  n13  n08  n21 rack11)
		(fit  n12  n09  n21 rack11)
		(fit  n10  n11  n21 rack11)
		(fit  n03  n18  n21 rack11)
		(fit  n18  n04  n22 rack11)
		(fit  n14  n08  n22 rack11)
		(fit  n13  n09  n22 rack11)
		(fit  n11  n11  n22 rack11)
		(fit  n04  n18  n22 rack11)
		(fit  n22  n04  n26 rack11)
		(fit  n18  n08  n26 rack11)
		(fit  n17  n09  n26 rack11)
		(fit  n15  n11  n26 rack11)
		(fit  n08  n18  n26 rack11)
		(fit  n01  n25  n26 rack11)
		(fit  n26  n04  n30 rack11)
		(fit  n22  n08  n30 rack11)
		(fit  n21  n09  n30 rack11)
		(fit  n19  n11  n30 rack11)
		(fit  n12  n18  n30 rack11)
		(fit  n05  n25  n30 rack11)
		; Sizes fitting rack: rack12
		(fit  n00  n04  n04 rack12)
		(fit  n01  n04  n05 rack12)
		(fit  n02  n04  n06 rack12)
		(fit  n03  n04  n07 rack12)
		(fit  n04  n04  n08 rack12)
		(fit  n00  n08  n08 rack12)
		(fit  n05  n04  n09 rack12)
		(fit  n01  n08  n09 rack12)
		(fit  n00  n09  n09 rack12)
		(fit  n06  n04  n10 rack12)
		(fit  n02  n08  n10 rack12)
		(fit  n01  n09  n10 rack12)
		(fit  n07  n04  n11 rack12)
		(fit  n03  n08  n11 rack12)
		(fit  n02  n09  n11 rack12)
		(fit  n00  n11  n11 rack12)
		(fit  n08  n04  n12 rack12)
		(fit  n04  n08  n12 rack12)
		(fit  n03  n09  n12 rack12)
		(fit  n01  n11  n12 rack12)
		(fit  n09  n04  n13 rack12)
		(fit  n05  n08  n13 rack12)
		(fit  n04  n09  n13 rack12)
		(fit  n02  n11  n13 rack12)
		(fit  n10  n04  n14 rack12)
		(fit  n06  n08  n14 rack12)
		(fit  n05  n09  n14 rack12)
		(fit  n03  n11  n14 rack12)
		(fit  n11  n04  n15 rack12)
		(fit  n07  n08  n15 rack12)
		(fit  n06  n09  n15 rack12)
		(fit  n04  n11  n15 rack12)
		(fit  n12  n04  n16 rack12)
		(fit  n08  n08  n16 rack12)
		(fit  n07  n09  n16 rack12)
		(fit  n05  n11  n16 rack12)
		(fit  n13  n04  n17 rack12)
		(fit  n09  n08  n17 rack12)
		(fit  n08  n09  n17 rack12)
		(fit  n06  n11  n17 rack12)
		(fit  n14  n04  n18 rack12)
		(fit  n10  n08  n18 rack12)
		(fit  n09  n09  n18 rack12)
		(fit  n07  n11  n18 rack12)
		(fit  n00  n18  n18 rack12)
		(fit  n16  n04  n20 rack12)
		(fit  n12  n08  n20 rack12)
		(fit  n11  n09  n20 rack12)
		(fit  n09  n11  n20 rack12)
		(fit  n02  n18  n20 rack12)
		(fit  n17  n04  n21 rack12)
		(fit  n13  n08  n21 rack12)
		(fit  n12  n09  n21 rack12)
		(fit  n10  n11  n21 rack12)
		(fit  n03  n18  n21 rack12)
		(fit  n18  n04  n22 rack12)
		(fit  n14  n08  n22 rack12)
		(fit  n13  n09  n22 rack12)
		(fit  n11  n11  n22 rack12)
		(fit  n04  n18  n22 rack12)
		(fit  n20  n04  n24 rack12)
		(fit  n16  n08  n24 rack12)
		(fit  n15  n09  n24 rack12)
		(fit  n13  n11  n24 rack12)
		(fit  n06  n18  n24 rack12)
		(fit  n21  n04  n25 rack12)
		(fit  n17  n08  n25 rack12)
		(fit  n16  n09  n25 rack12)
		(fit  n14  n11  n25 rack12)
		(fit  n07  n18  n25 rack12)
		(fit  n00  n25  n25 rack12)
		(fit  n25  n04  n29 rack12)
		(fit  n21  n08  n29 rack12)
		(fit  n20  n09  n29 rack12)
		(fit  n18  n11  n29 rack12)
		(fit  n11  n18  n29 rack12)
		(fit  n04  n25  n29 rack12)
		(fit  n01  n32  n33 rack12)
		(fit  n29  n04  n33 rack12)
		(fit  n25  n08  n33 rack12)
		(fit  n24  n09  n33 rack12)
		(fit  n22  n11  n33 rack12)
		(fit  n15  n18  n33 rack12)
		(fit  n08  n25  n33 rack12)
		; Sizes fitting rack: rack13
		(fit  n00  n04  n04 rack13)
		(fit  n01  n04  n05 rack13)
		(fit  n02  n04  n06 rack13)
		(fit  n03  n04  n07 rack13)
		(fit  n04  n04  n08 rack13)
		(fit  n00  n08  n08 rack13)
		(fit  n05  n04  n09 rack13)
		(fit  n01  n08  n09 rack13)
		(fit  n00  n09  n09 rack13)
		(fit  n07  n04  n11 rack13)
		(fit  n03  n08  n11 rack13)
		(fit  n02  n09  n11 rack13)
		(fit  n00  n11  n11 rack13)
		(fit  n08  n04  n12 rack13)
		(fit  n04  n08  n12 rack13)
		(fit  n03  n09  n12 rack13)
		(fit  n01  n11  n12 rack13)
		(fit  n09  n04  n13 rack13)
		(fit  n05  n08  n13 rack13)
		(fit  n04  n09  n13 rack13)
		(fit  n02  n11  n13 rack13)
		(fit  n11  n04  n15 rack13)
		(fit  n07  n08  n15 rack13)
		(fit  n06  n09  n15 rack13)
		(fit  n04  n11  n15 rack13)
		(fit  n12  n04  n16 rack13)
		(fit  n08  n08  n16 rack13)
		(fit  n07  n09  n16 rack13)
		(fit  n05  n11  n16 rack13)
		(fit  n16  n04  n20 rack13)
		(fit  n12  n08  n20 rack13)
		(fit  n11  n09  n20 rack13)
		(fit  n09  n11  n20 rack13)
		(fit  n02  n18  n20 rack13)
		(fit  n20  n04  n24 rack13)
		(fit  n16  n08  n24 rack13)
		(fit  n15  n09  n24 rack13)
		(fit  n13  n11  n24 rack13)
		(fit  n06  n18  n24 rack13)
		; Sizes fitting rack: rack14
		(fit  n00  n04  n04 rack14)
		(fit  n01  n04  n05 rack14)
		(fit  n02  n04  n06 rack14)
		(fit  n03  n04  n07 rack14)
		(fit  n04  n04  n08 rack14)
		(fit  n00  n08  n08 rack14)
		(fit  n05  n04  n09 rack14)
		(fit  n01  n08  n09 rack14)
		(fit  n00  n09  n09 rack14)
		(fit  n06  n04  n10 rack14)
		(fit  n02  n08  n10 rack14)
		(fit  n01  n09  n10 rack14)
		(fit  n07  n04  n11 rack14)
		(fit  n03  n08  n11 rack14)
		(fit  n02  n09  n11 rack14)
		(fit  n00  n11  n11 rack14)
		(fit  n08  n04  n12 rack14)
		(fit  n04  n08  n12 rack14)
		(fit  n03  n09  n12 rack14)
		(fit  n01  n11  n12 rack14)
		(fit  n09  n04  n13 rack14)
		(fit  n05  n08  n13 rack14)
		(fit  n04  n09  n13 rack14)
		(fit  n02  n11  n13 rack14)
		(fit  n10  n04  n14 rack14)
		(fit  n06  n08  n14 rack14)
		(fit  n05  n09  n14 rack14)
		(fit  n03  n11  n14 rack14)
		(fit  n11  n04  n15 rack14)
		(fit  n07  n08  n15 rack14)
		(fit  n06  n09  n15 rack14)
		(fit  n04  n11  n15 rack14)
		(fit  n12  n04  n16 rack14)
		(fit  n08  n08  n16 rack14)
		(fit  n07  n09  n16 rack14)
		(fit  n05  n11  n16 rack14)
		(fit  n13  n04  n17 rack14)
		(fit  n09  n08  n17 rack14)
		(fit  n08  n09  n17 rack14)
		(fit  n06  n11  n17 rack14)
		(fit  n14  n04  n18 rack14)
		(fit  n10  n08  n18 rack14)
		(fit  n09  n09  n18 rack14)
		(fit  n07  n11  n18 rack14)
		(fit  n00  n18  n18 rack14)
		(fit  n16  n04  n20 rack14)
		(fit  n12  n08  n20 rack14)
		(fit  n11  n09  n20 rack14)
		(fit  n09  n11  n20 rack14)
		(fit  n02  n18  n20 rack14)
		(fit  n17  n04  n21 rack14)
		(fit  n13  n08  n21 rack14)
		(fit  n12  n09  n21 rack14)
		(fit  n10  n11  n21 rack14)
		(fit  n03  n18  n21 rack14)
		(fit  n18  n04  n22 rack14)
		(fit  n14  n08  n22 rack14)
		(fit  n13  n09  n22 rack14)
		(fit  n11  n11  n22 rack14)
		(fit  n04  n18  n22 rack14)
		(fit  n20  n04  n24 rack14)
		(fit  n16  n08  n24 rack14)
		(fit  n15  n09  n24 rack14)
		(fit  n13  n11  n24 rack14)
		(fit  n06  n18  n24 rack14)
		(fit  n21  n04  n25 rack14)
		(fit  n17  n08  n25 rack14)
		(fit  n16  n09  n25 rack14)
		(fit  n14  n11  n25 rack14)
		(fit  n07  n18  n25 rack14)
		(fit  n00  n25  n25 rack14)
		(fit  n25  n04  n29 rack14)
		(fit  n21  n08  n29 rack14)
		(fit  n20  n09  n29 rack14)
		(fit  n18  n11  n29 rack14)
		(fit  n11  n18  n29 rack14)
		(fit  n04  n25  n29 rack14)
		(fit  n01  n32  n33 rack14)
		(fit  n29  n04  n33 rack14)
		(fit  n25  n08  n33 rack14)
		(fit  n24  n09  n33 rack14)
		(fit  n22  n11  n33 rack14)
		(fit  n15  n18  n33 rack14)
		(fit  n08  n25  n33 rack14)
		; Sizes fitting rack: rack15
		(fit  n00  n04  n04 rack15)
		(fit  n01  n04  n05 rack15)
		(fit  n02  n04  n06 rack15)
		(fit  n03  n04  n07 rack15)
		(fit  n04  n04  n08 rack15)
		(fit  n00  n08  n08 rack15)
		(fit  n06  n04  n10 rack15)
		(fit  n02  n08  n10 rack15)
		(fit  n01  n09  n10 rack15)
		(fit  n07  n04  n11 rack15)
		(fit  n03  n08  n11 rack15)
		(fit  n02  n09  n11 rack15)
		(fit  n00  n11  n11 rack15)
		(fit  n08  n04  n12 rack15)
		(fit  n04  n08  n12 rack15)
		(fit  n03  n09  n12 rack15)
		(fit  n01  n11  n12 rack15)
		(fit  n10  n04  n14 rack15)
		(fit  n06  n08  n14 rack15)
		(fit  n05  n09  n14 rack15)
		(fit  n03  n11  n14 rack15)
		(fit  n11  n04  n15 rack15)
		(fit  n07  n08  n15 rack15)
		(fit  n06  n09  n15 rack15)
		(fit  n04  n11  n15 rack15)
		(fit  n15  n04  n19 rack15)
		(fit  n11  n08  n19 rack15)
		(fit  n10  n09  n19 rack15)
		(fit  n08  n11  n19 rack15)
		(fit  n01  n18  n19 rack15)
		(fit  n19  n04  n23 rack15)
		(fit  n15  n08  n23 rack15)
		(fit  n14  n09  n23 rack15)
		(fit  n12  n11  n23 rack15)
		(fit  n05  n18  n23 rack15)
		; Sizes fitting rack: rack16
		(fit  n00  n04  n04 rack16)
		(fit  n01  n04  n05 rack16)
		(fit  n02  n04  n06 rack16)
		(fit  n03  n04  n07 rack16)
		(fit  n04  n04  n08 rack16)
		(fit  n00  n08  n08 rack16)
		(fit  n05  n04  n09 rack16)
		(fit  n01  n08  n09 rack16)
		(fit  n00  n09  n09 rack16)
		(fit  n06  n04  n10 rack16)
		(fit  n02  n08  n10 rack16)
		(fit  n01  n09  n10 rack16)
		(fit  n07  n04  n11 rack16)
		(fit  n03  n08  n11 rack16)
		(fit  n02  n09  n11 rack16)
		(fit  n00  n11  n11 rack16)
		(fit  n08  n04  n12 rack16)
		(fit  n04  n08  n12 rack16)
		(fit  n03  n09  n12 rack16)
		(fit  n01  n11  n12 rack16)
		(fit  n09  n04  n13 rack16)
		(fit  n05  n08  n13 rack16)
		(fit  n04  n09  n13 rack16)
		(fit  n02  n11  n13 rack16)
		(fit  n10  n04  n14 rack16)
		(fit  n06  n08  n14 rack16)
		(fit  n05  n09  n14 rack16)
		(fit  n03  n11  n14 rack16)
		(fit  n11  n04  n15 rack16)
		(fit  n07  n08  n15 rack16)
		(fit  n06  n09  n15 rack16)
		(fit  n04  n11  n15 rack16)
		(fit  n12  n04  n16 rack16)
		(fit  n08  n08  n16 rack16)
		(fit  n07  n09  n16 rack16)
		(fit  n05  n11  n16 rack16)
		(fit  n13  n04  n17 rack16)
		(fit  n09  n08  n17 rack16)
		(fit  n08  n09  n17 rack16)
		(fit  n06  n11  n17 rack16)
		(fit  n14  n04  n18 rack16)
		(fit  n10  n08  n18 rack16)
		(fit  n09  n09  n18 rack16)
		(fit  n07  n11  n18 rack16)
		(fit  n00  n18  n18 rack16)
		(fit  n16  n04  n20 rack16)
		(fit  n12  n08  n20 rack16)
		(fit  n11  n09  n20 rack16)
		(fit  n09  n11  n20 rack16)
		(fit  n02  n18  n20 rack16)
		(fit  n17  n04  n21 rack16)
		(fit  n13  n08  n21 rack16)
		(fit  n12  n09  n21 rack16)
		(fit  n10  n11  n21 rack16)
		(fit  n03  n18  n21 rack16)
		(fit  n18  n04  n22 rack16)
		(fit  n14  n08  n22 rack16)
		(fit  n13  n09  n22 rack16)
		(fit  n11  n11  n22 rack16)
		(fit  n04  n18  n22 rack16)
		(fit  n20  n04  n24 rack16)
		(fit  n16  n08  n24 rack16)
		(fit  n15  n09  n24 rack16)
		(fit  n13  n11  n24 rack16)
		(fit  n06  n18  n24 rack16)
		(fit  n21  n04  n25 rack16)
		(fit  n17  n08  n25 rack16)
		(fit  n16  n09  n25 rack16)
		(fit  n14  n11  n25 rack16)
		(fit  n07  n18  n25 rack16)
		(fit  n00  n25  n25 rack16)
		(fit  n25  n04  n29 rack16)
		(fit  n21  n08  n29 rack16)
		(fit  n20  n09  n29 rack16)
		(fit  n18  n11  n29 rack16)
		(fit  n11  n18  n29 rack16)
		(fit  n04  n25  n29 rack16)
		(fit  n01  n32  n33 rack16)
		(fit  n29  n04  n33 rack16)
		(fit  n25  n08  n33 rack16)
		(fit  n24  n09  n33 rack16)
		(fit  n22  n11  n33 rack16)
		(fit  n15  n18  n33 rack16)
		(fit  n08  n25  n33 rack16)
		; Sizes fitting rack: rack17
		(fit  n00  n04  n04 rack17)
		(fit  n01  n04  n05 rack17)
		(fit  n02  n04  n06 rack17)
		(fit  n03  n04  n07 rack17)
		(fit  n04  n04  n08 rack17)
		(fit  n00  n08  n08 rack17)
		(fit  n05  n04  n09 rack17)
		(fit  n01  n08  n09 rack17)
		(fit  n00  n09  n09 rack17)
		(fit  n06  n04  n10 rack17)
		(fit  n02  n08  n10 rack17)
		(fit  n01  n09  n10 rack17)
		(fit  n07  n04  n11 rack17)
		(fit  n03  n08  n11 rack17)
		(fit  n02  n09  n11 rack17)
		(fit  n00  n11  n11 rack17)
		(fit  n08  n04  n12 rack17)
		(fit  n04  n08  n12 rack17)
		(fit  n03  n09  n12 rack17)
		(fit  n01  n11  n12 rack17)
		(fit  n09  n04  n13 rack17)
		(fit  n05  n08  n13 rack17)
		(fit  n04  n09  n13 rack17)
		(fit  n02  n11  n13 rack17)
		(fit  n10  n04  n14 rack17)
		(fit  n06  n08  n14 rack17)
		(fit  n05  n09  n14 rack17)
		(fit  n03  n11  n14 rack17)
		(fit  n11  n04  n15 rack17)
		(fit  n07  n08  n15 rack17)
		(fit  n06  n09  n15 rack17)
		(fit  n04  n11  n15 rack17)
		(fit  n12  n04  n16 rack17)
		(fit  n08  n08  n16 rack17)
		(fit  n07  n09  n16 rack17)
		(fit  n05  n11  n16 rack17)
		(fit  n13  n04  n17 rack17)
		(fit  n09  n08  n17 rack17)
		(fit  n08  n09  n17 rack17)
		(fit  n06  n11  n17 rack17)
		(fit  n14  n04  n18 rack17)
		(fit  n10  n08  n18 rack17)
		(fit  n09  n09  n18 rack17)
		(fit  n07  n11  n18 rack17)
		(fit  n00  n18  n18 rack17)
		(fit  n15  n04  n19 rack17)
		(fit  n11  n08  n19 rack17)
		(fit  n10  n09  n19 rack17)
		(fit  n08  n11  n19 rack17)
		(fit  n01  n18  n19 rack17)
		(fit  n17  n04  n21 rack17)
		(fit  n13  n08  n21 rack17)
		(fit  n12  n09  n21 rack17)
		(fit  n10  n11  n21 rack17)
		(fit  n03  n18  n21 rack17)
		(fit  n18  n04  n22 rack17)
		(fit  n14  n08  n22 rack17)
		(fit  n13  n09  n22 rack17)
		(fit  n11  n11  n22 rack17)
		(fit  n04  n18  n22 rack17)
		(fit  n19  n04  n23 rack17)
		(fit  n15  n08  n23 rack17)
		(fit  n14  n09  n23 rack17)
		(fit  n12  n11  n23 rack17)
		(fit  n05  n18  n23 rack17)
		(fit  n21  n04  n25 rack17)
		(fit  n17  n08  n25 rack17)
		(fit  n16  n09  n25 rack17)
		(fit  n14  n11  n25 rack17)
		(fit  n07  n18  n25 rack17)
		(fit  n00  n25  n25 rack17)
		(fit  n22  n04  n26 rack17)
		(fit  n18  n08  n26 rack17)
		(fit  n17  n09  n26 rack17)
		(fit  n15  n11  n26 rack17)
		(fit  n08  n18  n26 rack17)
		(fit  n01  n25  n26 rack17)
		(fit  n26  n04  n30 rack17)
		(fit  n22  n08  n30 rack17)
		(fit  n21  n09  n30 rack17)
		(fit  n19  n11  n30 rack17)
		(fit  n12  n18  n30 rack17)
		(fit  n05  n25  n30 rack17)
		(fit  n02  n32  n34 rack17)
		(fit  n30  n04  n34 rack17)
		(fit  n26  n08  n34 rack17)
		(fit  n25  n09  n34 rack17)
		(fit  n23  n11  n34 rack17)
		(fit  n16  n18  n34 rack17)
		(fit  n09  n25  n34 rack17)
		; Sizes fitting rack: rack18
		(fit  n00  n04  n04 rack18)
		(fit  n01  n04  n05 rack18)
		(fit  n02  n04  n06 rack18)
		(fit  n03  n04  n07 rack18)
		(fit  n05  n04  n09 rack18)
		(fit  n01  n08  n09 rack18)
		(fit  n00  n09  n09 rack18)
		(fit  n06  n04  n10 rack18)
		(fit  n02  n08  n10 rack18)
		(fit  n01  n09  n10 rack18)
		(fit  n07  n04  n11 rack18)
		(fit  n03  n08  n11 rack18)
		(fit  n02  n09  n11 rack18)
		(fit  n00  n11  n11 rack18)
		(fit  n09  n04  n13 rack18)
		(fit  n05  n08  n13 rack18)
		(fit  n04  n09  n13 rack18)
		(fit  n02  n11  n13 rack18)
		(fit  n10  n04  n14 rack18)
		(fit  n06  n08  n14 rack18)
		(fit  n05  n09  n14 rack18)
		(fit  n03  n11  n14 rack18)
		(fit  n14  n04  n18 rack18)
		(fit  n10  n08  n18 rack18)
		(fit  n09  n09  n18 rack18)
		(fit  n07  n11  n18 rack18)
		(fit  n00  n18  n18 rack18)
		(fit  n18  n04  n22 rack18)
		(fit  n14  n08  n22 rack18)
		(fit  n13  n09  n22 rack18)
		(fit  n11  n11  n22 rack18)
		(fit  n04  n18  n22 rack18)
		; Sizes fitting rack: rack19
		(fit  n00  n04  n04 rack19)
		(fit  n01  n04  n05 rack19)
		(fit  n02  n04  n06 rack19)
		(fit  n03  n04  n07 rack19)
		(fit  n04  n04  n08 rack19)
		(fit  n00  n08  n08 rack19)
		(fit  n05  n04  n09 rack19)
		(fit  n01  n08  n09 rack19)
		(fit  n00  n09  n09 rack19)
		(fit  n06  n04  n10 rack19)
		(fit  n02  n08  n10 rack19)
		(fit  n01  n09  n10 rack19)
		(fit  n07  n04  n11 rack19)
		(fit  n03  n08  n11 rack19)
		(fit  n02  n09  n11 rack19)
		(fit  n00  n11  n11 rack19)
		(fit  n08  n04  n12 rack19)
		(fit  n04  n08  n12 rack19)
		(fit  n03  n09  n12 rack19)
		(fit  n01  n11  n12 rack19)
		(fit  n09  n04  n13 rack19)
		(fit  n05  n08  n13 rack19)
		(fit  n04  n09  n13 rack19)
		(fit  n02  n11  n13 rack19)
		(fit  n10  n04  n14 rack19)
		(fit  n06  n08  n14 rack19)
		(fit  n05  n09  n14 rack19)
		(fit  n03  n11  n14 rack19)
		(fit  n11  n04  n15 rack19)
		(fit  n07  n08  n15 rack19)
		(fit  n06  n09  n15 rack19)
		(fit  n04  n11  n15 rack19)
		(fit  n12  n04  n16 rack19)
		(fit  n08  n08  n16 rack19)
		(fit  n07  n09  n16 rack19)
		(fit  n05  n11  n16 rack19)
		(fit  n13  n04  n17 rack19)
		(fit  n09  n08  n17 rack19)
		(fit  n08  n09  n17 rack19)
		(fit  n06  n11  n17 rack19)
		(fit  n14  n04  n18 rack19)
		(fit  n10  n08  n18 rack19)
		(fit  n09  n09  n18 rack19)
		(fit  n07  n11  n18 rack19)
		(fit  n00  n18  n18 rack19)
		(fit  n15  n04  n19 rack19)
		(fit  n11  n08  n19 rack19)
		(fit  n10  n09  n19 rack19)
		(fit  n08  n11  n19 rack19)
		(fit  n01  n18  n19 rack19)
		(fit  n16  n04  n20 rack19)
		(fit  n12  n08  n20 rack19)
		(fit  n11  n09  n20 rack19)
		(fit  n09  n11  n20 rack19)
		(fit  n02  n18  n20 rack19)
		(fit  n17  n04  n21 rack19)
		(fit  n13  n08  n21 rack19)
		(fit  n12  n09  n21 rack19)
		(fit  n10  n11  n21 rack19)
		(fit  n03  n18  n21 rack19)
		(fit  n18  n04  n22 rack19)
		(fit  n14  n08  n22 rack19)
		(fit  n13  n09  n22 rack19)
		(fit  n11  n11  n22 rack19)
		(fit  n04  n18  n22 rack19)
		(fit  n20  n04  n24 rack19)
		(fit  n16  n08  n24 rack19)
		(fit  n15  n09  n24 rack19)
		(fit  n13  n11  n24 rack19)
		(fit  n06  n18  n24 rack19)
		(fit  n21  n04  n25 rack19)
		(fit  n17  n08  n25 rack19)
		(fit  n16  n09  n25 rack19)
		(fit  n14  n11  n25 rack19)
		(fit  n07  n18  n25 rack19)
		(fit  n00  n25  n25 rack19)
		(fit  n22  n04  n26 rack19)
		(fit  n18  n08  n26 rack19)
		(fit  n17  n09  n26 rack19)
		(fit  n15  n11  n26 rack19)
		(fit  n08  n18  n26 rack19)
		(fit  n01  n25  n26 rack19)
		(fit  n24  n04  n28 rack19)
		(fit  n20  n08  n28 rack19)
		(fit  n19  n09  n28 rack19)
		(fit  n17  n11  n28 rack19)
		(fit  n10  n18  n28 rack19)
		(fit  n03  n25  n28 rack19)
		(fit  n25  n04  n29 rack19)
		(fit  n21  n08  n29 rack19)
		(fit  n20  n09  n29 rack19)
		(fit  n18  n11  n29 rack19)
		(fit  n11  n18  n29 rack19)
		(fit  n04  n25  n29 rack19)
		(fit  n01  n32  n33 rack19)
		(fit  n29  n04  n33 rack19)
		(fit  n25  n08  n33 rack19)
		(fit  n24  n09  n33 rack19)
		(fit  n22  n11  n33 rack19)
		(fit  n15  n18  n33 rack19)
		(fit  n08  n25  n33 rack19)
		(fit  n05  n32  n37 rack19)
		(fit  n33  n04  n37 rack19)
		(fit  n29  n08  n37 rack19)
		(fit  n28  n09  n37 rack19)
		(fit  n26  n11  n37 rack19)
		(fit  n19  n18  n37 rack19)
		(fit  n12  n25  n37 rack19)
		; trailers (Beluga side):
		(empty beluga_trailer_1)
		(at-side beluga_trailer_1 bside)
		(empty beluga_trailer_2)
		(at-side beluga_trailer_2 bside)
		; trailers (Factory side):
		(empty factory_trailer_1)
		(at-side factory_trailer_1 fside)
		(empty factory_trailer_2)
		(at-side factory_trailer_2 fside)
		; Racks 20
		; Rack:rack00
		(empty rack00)
		(at-side rack00 bside)
		(at-side rack00 fside)
		(free-space rack00 n38)
		; Rack:rack01
		(empty rack01)
		(at-side rack01 bside)
		(at-side rack01 fside)
		(free-space rack01 n34)
		; Rack:rack02
		(at-side rack02 bside)
		(at-side rack02 fside)
		(free-space rack02 n07)
		(in jig0007 rack02)
		(clear jig0007 bside)
		(next-to jig0007 jig0006 bside)
		(next-to jig0006 jig0007 fside)
		(in jig0006 rack02)
		(clear jig0006 fside)
		; Rack:rack03
		(at-side rack03 bside)
		(at-side rack03 fside)
		(free-space rack03 n03)
		(in jig0008 rack03)
		(clear jig0008 bside)
		(clear jig0008 fside)
		; Rack:rack04
		(empty rack04)
		(at-side rack04 bside)
		(at-side rack04 fside)
		(free-space rack04 n25)
		; Rack:rack05
		(empty rack05)
		(at-side rack05 bside)
		(at-side rack05 fside)
		(free-space rack05 n38)
		; Rack:rack06
		(empty rack06)
		(at-side rack06 bside)
		(at-side rack06 fside)
		(free-space rack06 n26)
		; Rack:rack07
		(empty rack07)
		(at-side rack07 bside)
		(at-side rack07 fside)
		(free-space rack07 n29)
		; Rack:rack08
		(at-side rack08 bside)
		(at-side rack08 fside)
		(free-space rack08 n15)
		(in jig0002 rack08)
		(clear jig0002 bside)
		(clear jig0002 fside)
		; Rack:rack09
		(empty rack09)
		(at-side rack09 bside)
		(at-side rack09 fside)
		(free-space rack09 n33)
		; Rack:rack10
		(at-side rack10 bside)
		(at-side rack10 fside)
		(free-space rack10 n11)
		(in jig0003 rack10)
		(clear jig0003 bside)
		(clear jig0003 fside)
		; Rack:rack11
		(empty rack11)
		(at-side rack11 bside)
		(at-side rack11 fside)
		(free-space rack11 n30)
		; Rack:rack12
		(empty rack12)
		(at-side rack12 bside)
		(at-side rack12 fside)
		(free-space rack12 n33)
		; Rack:rack13
		(empty rack13)
		(at-side rack13 bside)
		(at-side rack13 fside)
		(free-space rack13 n24)
		; Rack:rack14
		(empty rack14)
		(at-side rack14 bside)
		(at-side rack14 fside)
		(free-space rack14 n33)
		; Rack:rack15
		(at-side rack15 bside)
		(at-side rack15 fside)
		(free-space rack15 n14)
		(in jig0004 rack15)
		(clear jig0004 bside)
		(clear jig0004 fside)
		; Rack:rack16
		(at-side rack16 bside)
		(at-side rack16 fside)
		(free-space rack16 n15)
		(in jig0001 rack16)
		(clear jig0001 bside)
		(clear jig0001 fside)
		; Rack:rack17
		(empty rack17)
		(at-side rack17 bside)
		(at-side rack17 fside)
		(free-space rack17 n34)
		; Rack:rack18
		(at-side rack18 bside)
		(at-side rack18 fside)
		(free-space rack18 n04)
		(in jig0005 rack18)
		(clear jig0005 bside)
		(clear jig0005 fside)
		; Rack:rack19
		(empty rack19)
		(at-side rack19 bside)
		(at-side rack19 fside)
		(free-space rack19 n37)
		; Jigs (size):
		(is_type jig0001 typeC)
		(size jig0001 n18)
		(empty-size jig0001 n09)
		(is_type jig0002 typeB)
		(size jig0002 n11)
		(empty-size jig0002 n08)
		(is_type jig0003 typeC)
		(size jig0003 n09)
		(empty-size jig0003 n09)
		(empty jig0003)
		(is_type jig0004 typeC)
		(size jig0004 n09)
		(empty-size jig0004 n09)
		(empty jig0004)
		(is_type jig0005 typeC)
		(size jig0005 n18)
		(empty-size jig0005 n09)
		(is_type jig0006 typeC)
		(size jig0006 n09)
		(empty-size jig0006 n09)
		(empty jig0006)
		(is_type jig0007 typeC)
		(size jig0007 n09)
		(empty-size jig0007 n09)
		(empty jig0007)
		(is_type jig0008 typeE)
		(size jig0008 n32)
		(empty-size jig0008 n32)
		(is_type jig0009 typeE)
		(size jig0009 n32)
		(empty-size jig0009 n32)
		(is_type jig0010 typeE)
		(size jig0010 n32)
		(empty-size jig0010 n32)
		(is_type jig0011 typeD)
		(size jig0011 n25)
		(empty-size jig0011 n18)
		(is_type jig0012 typeD)
		(size jig0012 n25)
		(empty-size jig0012 n18)
		(is_type jig0013 typeB)
		(size jig0013 n11)
		(empty-size jig0013 n08)
		(is_type jig0014 typeB)
		(size jig0014 n11)
		(empty-size jig0014 n08)
		(is_type jig0015 typeB)
		(size jig0015 n11)
		(empty-size jig0015 n08)
		(is_type jig0016 typeE)
		(size jig0016 n32)
		(empty-size jig0016 n32)
		(is_type jig0017 typeD)
		(size jig0017 n25)
		(empty-size jig0017 n18)
		(is_type jig0018 typeE)
		(size jig0018 n32)
		(empty-size jig0018 n32)
		(is_type jig0019 typeB)
		(size jig0019 n11)
		(empty-size jig0019 n08)
		(is_type jig0020 typeB)
		(size jig0020 n11)
		(empty-size jig0020 n08)
		(is_type jig0021 typeB)
		(size jig0021 n11)
		(empty-size jig0021 n08)
		(is_type jig0022 typeD)
		(size jig0022 n25)
		(empty-size jig0022 n18)
		(is_type jig0023 typeE)
		(size jig0023 n32)
		(empty-size jig0023 n32)
		(is_type jig0024 typeC)
		(size jig0024 n18)
		(empty-size jig0024 n09)
		(is_type jig0025 typeC)
		(size jig0025 n18)
		(empty-size jig0025 n09)
		(is_type jig0026 typeE)
		(size jig0026 n32)
		(empty-size jig0026 n32)
		(is_type jig0027 typeC)
		(size jig0027 n18)
		(empty-size jig0027 n09)
		(is_type jig0028 typeC)
		(size jig0028 n18)
		(empty-size jig0028 n09)
		(is_type jig0029 typeD)
		(size jig0029 n25)
		(empty-size jig0029 n18)
		(is_type jig0030 typeE)
		(size jig0030 n32)
		(empty-size jig0030 n32)
		(is_type jig0031 typeD)
		(size jig0031 n25)
		(empty-size jig0031 n18)
		(is_type jig0032 typeE)
		(size jig0032 n32)
		(empty-size jig0032 n32)
		(is_type jig0033 typeC)
		(size jig0033 n18)
		(empty-size jig0033 n09)
		(is_type jig0034 typeC)
		(size jig0034 n18)
		(empty-size jig0034 n09)
		(is_type jig0035 typeD)
		(size jig0035 n25)
		(empty-size jig0035 n18)
		(is_type jig0036 typeD)
		(size jig0036 n25)
		(empty-size jig0036 n18)
		(is_type jig0037 typeC)
		(size jig0037 n18)
		(empty-size jig0037 n09)
		(is_type jig0038 typeC)
		(size jig0038 n18)
		(empty-size jig0038 n09)
		(is_type jig0039 typeC)
		(size jig0039 n18)
		(empty-size jig0039 n09)
		(is_type jig0040 typeC)
		(size jig0040 n18)
		(empty-size jig0040 n09)
		(is_type jig0041 typeB)
		(size jig0041 n11)
		(empty-size jig0041 n08)
		(is_type jig0042 typeB)
		(size jig0042 n11)
		(empty-size jig0042 n08)
		(is_type jig0043 typeB)
		(size jig0043 n11)
		(empty-size jig0043 n08)
		(is_type jig0044 typeB)
		(size jig0044 n11)
		(empty-size jig0044 n08)
		(is_type jig0045 typeB)
		(size jig0045 n11)
		(empty-size jig0045 n08)
		(is_type jig0046 typeB)
		(size jig0046 n11)
		(empty-size jig0046 n08)
		(is_type jig0047 typeB)
		(size jig0047 n11)
		(empty-size jig0047 n08)
		(is_type jig0048 typeB)
		(size jig0048 n11)
		(empty-size jig0048 n08)
		(is_type jig0049 typeB)
		(size jig0049 n11)
		(empty-size jig0049 n08)
		(is_type jig0050 typeB)
		(size jig0050 n11)
		(empty-size jig0050 n08)
		(is_type jig0051 typeB)
		(size jig0051 n11)
		(empty-size jig0051 n08)
		(is_type jig0052 typeB)
		(size jig0052 n11)
		(empty-size jig0052 n08)
		(is_type jig0053 typeD)
		(size jig0053 n25)
		(empty-size jig0053 n18)
		(is_type jig0054 typeB)
		(size jig0054 n11)
		(empty-size jig0054 n08)
		(is_type jig0055 typeB)
		(size jig0055 n11)
		(empty-size jig0055 n08)
		(is_type jig0056 typeB)
		(size jig0056 n11)
		(empty-size jig0056 n08)
		(is_type jig0057 typeD)
		(size jig0057 n25)
		(empty-size jig0057 n18)
		(is_type jig0058 typeD)
		(size jig0058 n25)
		(empty-size jig0058 n18)
		(is_type jig0059 typeC)
		(size jig0059 n18)
		(empty-size jig0059 n09)
		(is_type jig0060 typeC)
		(size jig0060 n18)
		(empty-size jig0060 n09)
		(is_type jig0061 typeD)
		(size jig0061 n25)
		(empty-size jig0061 n18)
		(is_type jig0062 typeB)
		(size jig0062 n11)
		(empty-size jig0062 n08)
		(is_type jig0063 typeB)
		(size jig0063 n11)
		(empty-size jig0063 n08)
		(is_type jig0064 typeB)
		(size jig0064 n11)
		(empty-size jig0064 n08)
		(is_type jig0065 typeC)
		(size jig0065 n18)
		(empty-size jig0065 n09)
		(is_type jig0066 typeC)
		(size jig0066 n18)
		(empty-size jig0066 n09)
		(is_type jig0067 typeC)
		(size jig0067 n18)
		(empty-size jig0067 n09)
		(is_type jig0068 typeC)
		(size jig0068 n18)
		(empty-size jig0068 n09)
		(is_type jig0069 typeA)
		(size jig0069 n04)
		(empty-size jig0069 n04)
		(is_type jig0070 typeA)
		(size jig0070 n04)
		(empty-size jig0070 n04)
		(is_type jig0071 typeA)
		(size jig0071 n04)
		(empty-size jig0071 n04)
		(is_type jig0072 typeA)
		(size jig0072 n04)
		(empty-size jig0072 n04)
		(is_type jig0073 typeA)
		(size jig0073 n04)
		(empty-size jig0073 n04)
		(is_type jig0074 typeA)
		(size jig0074 n04)
		(empty-size jig0074 n04)
		(is_type jig0075 typeA)
		(size jig0075 n04)
		(empty-size jig0075 n04)
		(is_type jig0076 typeA)
		(size jig0076 n04)
		(empty-size jig0076 n04)
		(is_type jig0077 typeA)
		(size jig0077 n04)
		(empty-size jig0077 n04)
		(is_type jig0078 typeA)
		(size jig0078 n04)
		(empty-size jig0078 n04)
		(is_type jig0079 typeD)
		(size jig0079 n25)
		(empty-size jig0079 n18)
		(is_type jig0080 typeE)
		(size jig0080 n32)
		(empty-size jig0080 n32)
		(is_type jig0081 typeB)
		(size jig0081 n11)
		(empty-size jig0081 n08)
		(is_type jig0082 typeB)
		(size jig0082 n11)
		(empty-size jig0082 n08)
		(is_type jig0083 typeB)
		(size jig0083 n11)
		(empty-size jig0083 n08)
		(is_type jig0084 typeE)
		(size jig0084 n32)
		(empty-size jig0084 n32)
		(is_type jig0085 typeD)
		(size jig0085 n25)
		(empty-size jig0085 n18)
		(is_type jig0086 typeC)
		(size jig0086 n18)
		(empty-size jig0086 n09)
		(is_type jig0087 typeC)
		(size jig0087 n18)
		(empty-size jig0087 n09)
		(is_type jig0088 typeC)
		(size jig0088 n18)
		(empty-size jig0088 n09)
		(is_type jig0089 typeD)
		(size jig0089 n25)
		(empty-size jig0089 n18)
		(is_type jig0090 typeB)
		(size jig0090 n11)
		(empty-size jig0090 n08)
		(is_type jig0091 typeB)
		(size jig0091 n11)
		(empty-size jig0091 n08)
		(is_type jig0092 typeB)
		(size jig0092 n11)
		(empty-size jig0092 n08)
		(is_type jig0093 typeA)
		(size jig0093 n04)
		(empty-size jig0093 n04)
		(is_type jig0094 typeA)
		(size jig0094 n04)
		(empty-size jig0094 n04)
		(is_type jig0095 typeA)
		(size jig0095 n04)
		(empty-size jig0095 n04)
		(is_type jig0096 typeA)
		(size jig0096 n04)
		(empty-size jig0096 n04)
		(is_type jig0097 typeA)
		(size jig0097 n04)
		(empty-size jig0097 n04)
		(is_type jig0098 typeA)
		(size jig0098 n04)
		(empty-size jig0098 n04)
		(is_type jig0099 typeA)
		(size jig0099 n04)
		(empty-size jig0099 n04)
		(is_type jig0100 typeA)
		(size jig0100 n04)
		(empty-size jig0100 n04)
		(is_type jig0101 typeA)
		(size jig0101 n04)
		(empty-size jig0101 n04)
		(is_type jig0102 typeA)
		(size jig0102 n04)
		(empty-size jig0102 n04)
		(is_type jig0103 typeE)
		(size jig0103 n32)
		(empty-size jig0103 n32)
		(is_type jig0104 typeB)
		(size jig0104 n11)
		(empty-size jig0104 n08)
		(is_type jig0105 typeB)
		(size jig0105 n11)
		(empty-size jig0105 n08)
		(is_type jig0106 typeB)
		(size jig0106 n11)
		(empty-size jig0106 n08)
		(is_type jig0107 typeE)
		(size jig0107 n32)
		(empty-size jig0107 n32)
		(is_type jig0108 typeE)
		(size jig0108 n32)
		(empty-size jig0108 n32)
		(is_type jig0109 typeE)
		(size jig0109 n32)
		(empty-size jig0109 n32)
		(is_type jig0110 typeB)
		(size jig0110 n11)
		(empty-size jig0110 n08)
		(is_type jig0111 typeB)
		(size jig0111 n11)
		(empty-size jig0111 n08)
		(is_type jig0112 typeB)
		(size jig0112 n11)
		(empty-size jig0112 n08)
		(is_type jig0113 typeC)
		(size jig0113 n18)
		(empty-size jig0113 n09)
		(is_type jig0114 typeA)
		(size jig0114 n04)
		(empty-size jig0114 n04)
		(is_type jig0115 typeA)
		(size jig0115 n04)
		(empty-size jig0115 n04)
		(is_type jig0116 typeA)
		(size jig0116 n04)
		(empty-size jig0116 n04)
		(is_type jig0117 typeA)
		(size jig0117 n04)
		(empty-size jig0117 n04)
		(is_type jig0118 typeA)
		(size jig0118 n04)
		(empty-size jig0118 n04)
		(is_type jig0119 typeA)
		(size jig0119 n04)
		(empty-size jig0119 n04)
		(is_type jig0120 typeA)
		(size jig0120 n04)
		(empty-size jig0120 n04)
		(is_type jig0121 typeA)
		(size jig0121 n04)
		(empty-size jig0121 n04)
		(is_type jig0122 typeA)
		(size jig0122 n04)
		(empty-size jig0122 n04)
		(is_type jig0123 typeA)
		(size jig0123 n04)
		(empty-size jig0123 n04)
		(is_type jig0124 typeA)
		(size jig0124 n04)
		(empty-size jig0124 n04)
		(is_type jig0125 typeA)
		(size jig0125 n04)
		(empty-size jig0125 n04)
		(is_type jig0126 typeA)
		(size jig0126 n04)
		(empty-size jig0126 n04)
		(is_type jig0127 typeA)
		(size jig0127 n04)
		(empty-size jig0127 n04)
		(is_type jig0128 typeA)
		(size jig0128 n04)
		(empty-size jig0128 n04)
		(is_type jig0129 typeA)
		(size jig0129 n04)
		(empty-size jig0129 n04)
		(is_type jig0130 typeA)
		(size jig0130 n04)
		(empty-size jig0130 n04)
		(is_type jig0131 typeA)
		(size jig0131 n04)
		(empty-size jig0131 n04)
		(is_type jig0132 typeA)
		(size jig0132 n04)
		(empty-size jig0132 n04)
		(is_type jig0133 typeA)
		(size jig0133 n04)
		(empty-size jig0133 n04)
		(is_type jig0134 typeA)
		(size jig0134 n04)
		(empty-size jig0134 n04)
		(is_type jig0135 typeA)
		(size jig0135 n04)
		(empty-size jig0135 n04)
		(is_type jig0136 typeC)
		(size jig0136 n18)
		(empty-size jig0136 n09)
		(is_type jig0137 typeC)
		(size jig0137 n18)
		(empty-size jig0137 n09)
		(is_type jig0138 typeB)
		(size jig0138 n11)
		(empty-size jig0138 n08)
		(is_type jig0139 typeB)
		(size jig0139 n11)
		(empty-size jig0139 n08)
		(is_type jig0140 typeB)
		(size jig0140 n11)
		(empty-size jig0140 n08)
		(is_type jig0141 typeC)
		(size jig0141 n18)
		(empty-size jig0141 n09)
		(is_type jig0142 typeC)
		(size jig0142 n18)
		(empty-size jig0142 n09)
		(is_type jig0143 typeE)
		(size jig0143 n32)
		(empty-size jig0143 n32)
		(is_type jig0144 typeC)
		(size jig0144 n18)
		(empty-size jig0144 n09)
		(is_type jig0145 typeC)
		(size jig0145 n18)
		(empty-size jig0145 n09)
		(is_type jig0146 typeC)
		(size jig0146 n18)
		(empty-size jig0146 n09)
		(is_type jig0147 typeC)
		(size jig0147 n18)
		(empty-size jig0147 n09)
		(is_type jig0148 typeB)
		(size jig0148 n11)
		(empty-size jig0148 n08)
		(is_type jig0149 typeB)
		(size jig0149 n11)
		(empty-size jig0149 n08)
		(is_type jig0150 typeB)
		(size jig0150 n11)
		(empty-size jig0150 n08)
		(is_type jig0151 typeD)
		(size jig0151 n25)
		(empty-size jig0151 n18)
		(is_type jig0152 typeB)
		(size jig0152 n11)
		(empty-size jig0152 n08)
		(is_type jig0153 typeB)
		(size jig0153 n11)
		(empty-size jig0153 n08)
		(is_type jig0154 typeB)
		(size jig0154 n11)
		(empty-size jig0154 n08)
		(is_type jig0155 typeC)
		(size jig0155 n18)
		(empty-size jig0155 n09)
		(is_type jig0156 typeA)
		(size jig0156 n04)
		(empty-size jig0156 n04)
		(is_type jig0157 typeA)
		(size jig0157 n04)
		(empty-size jig0157 n04)
		(is_type jig0158 typeA)
		(size jig0158 n04)
		(empty-size jig0158 n04)
		(is_type jig0159 typeA)
		(size jig0159 n04)
		(empty-size jig0159 n04)
		(is_type jig0160 typeA)
		(size jig0160 n04)
		(empty-size jig0160 n04)
		(is_type jig0161 typeA)
		(size jig0161 n04)
		(empty-size jig0161 n04)
		(is_type jig0162 typeA)
		(size jig0162 n04)
		(empty-size jig0162 n04)
		(is_type jig0163 typeA)
		(size jig0163 n04)
		(empty-size jig0163 n04)
		(is_type jig0164 typeA)
		(size jig0164 n04)
		(empty-size jig0164 n04)
		(is_type jig0165 typeA)
		(size jig0165 n04)
		(empty-size jig0165 n04)
		(is_type jig0166 typeE)
		(size jig0166 n32)
		(empty-size jig0166 n32)
		(is_type jig0167 typeA)
		(size jig0167 n04)
		(empty-size jig0167 n04)
		(is_type jig0168 typeA)
		(size jig0168 n04)
		(empty-size jig0168 n04)
		(is_type jig0169 typeA)
		(size jig0169 n04)
		(empty-size jig0169 n04)
		(is_type jig0170 typeA)
		(size jig0170 n04)
		(empty-size jig0170 n04)
		(is_type jig0171 typeA)
		(size jig0171 n04)
		(empty-size jig0171 n04)
		(is_type jig0172 typeA)
		(size jig0172 n04)
		(empty-size jig0172 n04)
		(is_type jig0173 typeA)
		(size jig0173 n04)
		(empty-size jig0173 n04)
		(is_type jig0174 typeA)
		(size jig0174 n04)
		(empty-size jig0174 n04)
		(is_type jig0175 typeA)
		(size jig0175 n04)
		(empty-size jig0175 n04)
		(is_type jig0176 typeA)
		(size jig0176 n04)
		(empty-size jig0176 n04)
		(is_type jig0177 typeD)
		(size jig0177 n25)
		(empty-size jig0177 n18)
		(is_type jig0178 typeE)
		(size jig0178 n32)
		(empty-size jig0178 n32)
		(is_type jig0179 typeC)
		(size jig0179 n18)
		(empty-size jig0179 n09)
		(is_type jig0180 typeC)
		(size jig0180 n18)
		(empty-size jig0180 n09)
		(is_type jig0181 typeD)
		(size jig0181 n25)
		(empty-size jig0181 n18)
		(is_type jig0182 typeB)
		(size jig0182 n11)
		(empty-size jig0182 n08)
		(is_type jig0183 typeB)
		(size jig0183 n11)
		(empty-size jig0183 n08)
		(is_type jig0184 typeB)
		(size jig0184 n11)
		(empty-size jig0184 n08)
		(is_type jig0185 typeB)
		(size jig0185 n11)
		(empty-size jig0185 n08)
		(is_type jig0186 typeB)
		(size jig0186 n11)
		(empty-size jig0186 n08)
		(is_type jig0187 typeB)
		(size jig0187 n11)
		(empty-size jig0187 n08)
		(is_type jig0188 typeE)
		(size jig0188 n32)
		(empty-size jig0188 n32)
		(is_type jig0189 typeB)
		(size jig0189 n11)
		(empty-size jig0189 n08)
		(is_type jig0190 typeB)
		(size jig0190 n11)
		(empty-size jig0190 n08)
		(is_type jig0191 typeB)
		(size jig0191 n11)
		(empty-size jig0191 n08)
		(is_type jig0192 typeD)
		(size jig0192 n25)
		(empty-size jig0192 n18)
		(is_type jig0193 typeB)
		(size jig0193 n11)
		(empty-size jig0193 n08)
		(is_type jig0194 typeB)
		(size jig0194 n11)
		(empty-size jig0194 n08)
		(is_type jig0195 typeB)
		(size jig0195 n11)
		(empty-size jig0195 n08)
		(is_type jig0196 typeC)
		(size jig0196 n18)
		(empty-size jig0196 n09)
		(is_type jig0197 typeC)
		(size jig0197 n18)
		(empty-size jig0197 n09)
		(is_type jig0198 typeC)
		(size jig0198 n18)
		(empty-size jig0198 n09)
		(is_type jig0199 typeC)
		(size jig0199 n18)
		(empty-size jig0199 n09)
		(is_type jig0200 typeE)
		(size jig0200 n32)
		(empty-size jig0200 n32)
		(is_type jig0201 typeC)
		(size jig0201 n18)
		(empty-size jig0201 n09)
		(is_type jig0202 typeC)
		(size jig0202 n18)
		(empty-size jig0202 n09)
		(is_type jig0203 typeC)
		(size jig0203 n18)
		(empty-size jig0203 n09)
		(is_type jig0204 typeA)
		(size jig0204 n04)
		(empty-size jig0204 n04)
		(is_type jig0205 typeA)
		(size jig0205 n04)
		(empty-size jig0205 n04)
		(is_type jig0206 typeA)
		(size jig0206 n04)
		(empty-size jig0206 n04)
		(is_type jig0207 typeA)
		(size jig0207 n04)
		(empty-size jig0207 n04)
		(is_type jig0208 typeA)
		(size jig0208 n04)
		(empty-size jig0208 n04)
		(is_type jig0209 typeA)
		(size jig0209 n04)
		(empty-size jig0209 n04)
		(is_type jig0210 typeA)
		(size jig0210 n04)
		(empty-size jig0210 n04)
		(is_type jig0211 typeA)
		(size jig0211 n04)
		(empty-size jig0211 n04)
		(is_type jig0212 typeA)
		(size jig0212 n04)
		(empty-size jig0212 n04)
		(is_type jig0213 typeA)
		(size jig0213 n04)
		(empty-size jig0213 n04)
		(is_type jig0214 typeA)
		(size jig0214 n04)
		(empty-size jig0214 n04)
		(is_type jig0215 typeA)
		(size jig0215 n04)
		(empty-size jig0215 n04)
		(is_type jig0216 typeA)
		(size jig0216 n04)
		(empty-size jig0216 n04)
		(is_type jig0217 typeA)
		(size jig0217 n04)
		(empty-size jig0217 n04)
		(is_type jig0218 typeA)
		(size jig0218 n04)
		(empty-size jig0218 n04)
		(is_type jig0219 typeA)
		(size jig0219 n04)
		(empty-size jig0219 n04)
		(is_type jig0220 typeA)
		(size jig0220 n04)
		(empty-size jig0220 n04)
		(is_type jig0221 typeA)
		(size jig0221 n04)
		(empty-size jig0221 n04)
		(is_type jig0222 typeA)
		(size jig0222 n04)
		(empty-size jig0222 n04)
		(is_type jig0223 typeA)
		(size jig0223 n04)
		(empty-size jig0223 n04)
		(is_type jig0224 typeC)
		(size jig0224 n18)
		(empty-size jig0224 n09)
		(is_type jig0225 typeC)
		(size jig0225 n18)
		(empty-size jig0225 n09)
		(is_type jig0226 typeD)
		(size jig0226 n25)
		(empty-size jig0226 n18)
		(is_type jig0227 typeC)
		(size jig0227 n18)
		(empty-size jig0227 n09)
		(is_type jig0228 typeC)
		(size jig0228 n18)
		(empty-size jig0228 n09)
		(is_type jig0229 typeD)
		(size jig0229 n25)
		(empty-size jig0229 n18)
		(is_type jig0230 typeB)
		(size jig0230 n11)
		(empty-size jig0230 n08)
		(is_type jig0231 typeB)
		(size jig0231 n11)
		(empty-size jig0231 n08)
		(is_type jig0232 typeB)
		(size jig0232 n11)
		(empty-size jig0232 n08)
		(is_type jig0233 typeE)
		(size jig0233 n32)
		(empty-size jig0233 n32)
		(is_type jig0234 typeE)
		(size jig0234 n32)
		(empty-size jig0234 n32)
		(is_type jig0235 typeE)
		(size jig0235 n32)
		(empty-size jig0235 n32)
		(is_type jig0236 typeD)
		(size jig0236 n25)
		(empty-size jig0236 n18)
		(is_type jig0237 typeD)
		(size jig0237 n25)
		(empty-size jig0237 n18)
		(is_type jig0238 typeB)
		(size jig0238 n11)
		(empty-size jig0238 n08)
		(is_type jig0239 typeB)
		(size jig0239 n11)
		(empty-size jig0239 n08)
		(is_type jig0240 typeB)
		(size jig0240 n11)
		(empty-size jig0240 n08)
		(is_type jig0241 typeD)
		(size jig0241 n25)
		(empty-size jig0241 n18)
		(is_type jig0242 typeC)
		(size jig0242 n18)
		(empty-size jig0242 n09)
		(is_type jig0243 typeC)
		(size jig0243 n18)
		(empty-size jig0243 n09)
		(is_type jig0244 typeC)
		(size jig0244 n18)
		(empty-size jig0244 n09)
		(is_type jig0245 typeC)
		(size jig0245 n18)
		(empty-size jig0245 n09)
		(is_type jig0246 typeB)
		(size jig0246 n11)
		(empty-size jig0246 n08)
		(is_type jig0247 typeC)
		(size jig0247 n18)
		(empty-size jig0247 n09)
		(is_type jig0248 typeB)
		(size jig0248 n11)
		(empty-size jig0248 n08)
		(is_type jig0249 typeB)
		(size jig0249 n11)
		(empty-size jig0249 n08)
		(is_type jig0250 typeB)
		(size jig0250 n11)
		(empty-size jig0250 n08)
		(is_type jig0251 typeD)
		(size jig0251 n25)
		(empty-size jig0251 n18)
		(is_type jig0252 typeB)
		(size jig0252 n11)
		(empty-size jig0252 n08)
		(is_type jig0253 typeB)
		(size jig0253 n11)
		(empty-size jig0253 n08)
		(is_type jig0254 typeB)
		(size jig0254 n11)
		(empty-size jig0254 n08)
		(is_type jig0255 typeE)
		(size jig0255 n32)
		(empty-size jig0255 n32)
		(is_type jig0256 typeE)
		(size jig0256 n32)
		(empty-size jig0256 n32)
		(is_type jig0257 typeE)
		(size jig0257 n32)
		(empty-size jig0257 n32)
		(is_type jig0258 typeC)
		(size jig0258 n18)
		(empty-size jig0258 n09)
		(is_type jig0259 typeC)
		(size jig0259 n18)
		(empty-size jig0259 n09)
		(is_type jig0260 typeC)
		(size jig0260 n18)
		(empty-size jig0260 n09)
		(is_type jig0261 typeC)
		(size jig0261 n18)
		(empty-size jig0261 n09)
		(is_type jig0262 typeD)
		(size jig0262 n25)
		(empty-size jig0262 n18)
		(is_type jig0263 typeE)
		(size jig0263 n32)
		(empty-size jig0263 n32)
		(is_type jig0264 typeC)
		(size jig0264 n18)
		(empty-size jig0264 n09)
		(is_type jig0265 typeC)
		(size jig0265 n18)
		(empty-size jig0265 n09)
		(is_type jig0266 typeE)
		(size jig0266 n32)
		(empty-size jig0266 n32)
		; hangars:
		(empty hangar1)
		(empty hangar2)
		(empty hangar3)
		; Flight schedule initial phase:
		(processed-flight beluga1)
		; Flight order:
		(next-flight-to-process beluga1 beluga2)
		(next-flight-to-process beluga2 beluga3)
		(next-flight-to-process beluga3 beluga4)
		(next-flight-to-process beluga4 beluga5)
		(next-flight-to-process beluga5 beluga6)
		(next-flight-to-process beluga6 beluga7)
		(next-flight-to-process beluga7 beluga8)
		(next-flight-to-process beluga8 beluga9)
		(next-flight-to-process beluga9 beluga10)
		(next-flight-to-process beluga10 beluga11)
		(next-flight-to-process beluga11 beluga12)
		(next-flight-to-process beluga12 beluga13)
		(next-flight-to-process beluga13 beluga14)
		(next-flight-to-process beluga14 beluga15)
		(next-flight-to-process beluga15 beluga16)
		(next-flight-to-process beluga16 beluga17)
		(next-flight-to-process beluga17 beluga18)
		(next-flight-to-process beluga18 beluga19)
		(next-flight-to-process beluga19 beluga20)
		(next-flight-to-process beluga20 beluga21)
		(next-flight-to-process beluga21 beluga22)
		(next-flight-to-process beluga22 beluga23)
		(next-flight-to-process beluga23 beluga24)
		(next-flight-to-process beluga24 beluga25)
		(next-flight-to-process beluga25 beluga26)
		(next-flight-to-process beluga26 beluga27)
		(next-flight-to-process beluga27 beluga28)
		(next-flight-to-process beluga28 beluga29)
		(next-flight-to-process beluga29 beluga30)
		(next-flight-to-process beluga30 beluga31)
		(next-flight-to-process beluga31 beluga32)
		(next-flight-to-process beluga32 beluga33)
		(next-flight-to-process beluga33 beluga34)
		(next-flight-to-process beluga34 beluga35)
		(next-flight-to-process beluga35 beluga36)
		(next-flight-to-process beluga36 beluga37)
		(next-flight-to-process beluga37 beluga38)
		(next-flight-to-process beluga38 beluga39)
		(next-flight-to-process beluga39 beluga40)
		(next-flight-to-process beluga40 beluga41)
		(next-flight-to-process beluga41 beluga42)
		(next-flight-to-process beluga42 beluga43)
		(next-flight-to-process beluga43 beluga44)
		(next-flight-to-process beluga44 beluga45)
		(next-flight-to-process beluga45 beluga46)
		(next-flight-to-process beluga46 beluga47)
		(next-flight-to-process beluga47 beluga48)
		(next-flight-to-process beluga48 beluga49)
		(next-flight-to-process beluga49 beluga50)
		(next-flight-to-process beluga50 beluga51)
		(next-flight-to-process beluga51 beluga52)
		(next-flight-to-process beluga52 beluga53)
		(next-flight-to-process beluga53 beluga54)
		(next-flight-to-process beluga54 beluga55)
		(next-flight-to-process beluga55 beluga56)
		(next-flight-to-process beluga56 beluga57)
		(next-flight-to-process beluga57 beluga58)
		(next-flight-to-process beluga58 beluga59)
		(next-flight-to-process beluga59 beluga60)
		(next-flight-to-process beluga60 beluga61)
		(next-flight-to-process beluga61 beluga62)
		(next-flight-to-process beluga62 beluga63)
		(next-flight-to-process beluga63 beluga64)
		(next-flight-to-process beluga64 beluga65)
		(next-flight-to-process beluga65 beluga66)
		(next-flight-to-process beluga66 beluga67)
		(next-flight-to-process beluga67 beluga68)
		(next-flight-to-process beluga68 beluga69)
		(next-flight-to-process beluga69 beluga70)
		(next-flight-to-process beluga70 beluga71)
		(next-flight-to-process beluga71 beluga72)
		(next-flight-to-process beluga72 beluga73)
		(next-flight-to-process beluga73 beluga74)
		(next-flight-to-process beluga74 beluga75)
		(next-flight-to-process beluga75 beluga76)
		(next-flight-to-process beluga76 beluga77)
		(next-flight-to-process beluga77 beluga78)
		(next-flight-to-process beluga78 beluga79)
		(next-flight-to-process beluga79 beluga80)
		(next-flight-to-process beluga80 beluga81)
		(next-flight-to-process beluga81 beluga82)
		(next-flight-to-process beluga82 beluga83)
		(next-flight-to-process beluga83 beluga84)
		(next-flight-to-process beluga84 beluga85)
		(next-flight-to-process beluga85 beluga86)
		(next-flight-to-process beluga86 beluga87)
		(next-flight-to-process beluga87 beluga88)
		(next-flight-to-process beluga88 beluga89)
		(next-flight-to-process beluga89 beluga90)
		(next-flight-to-process beluga90 beluga91)
		(next-flight-to-process beluga91 beluga92)
		(next-flight-to-process beluga92 beluga93)
		(next-flight-to-process beluga93 beluga94)
		(next-flight-to-process beluga94 beluga95)
		(next-flight-to-process beluga95 beluga96)
		(next-flight-to-process beluga96 beluga97)
		(next-flight-to-process beluga97 beluga98)
		(next-flight-to-process beluga98 beluga99)
		(next-flight-to-process beluga99 beluga100)
		(next-flight-to-process beluga100 beluga101)
		(next-flight-to-process beluga101 beluga102)
		(next-flight-to-process beluga102 beluga103)
		(next-flight-to-process beluga103 beluga104)
		(next-flight-to-process beluga104 beluga105)
		(next-flight-to-process beluga105 beluga106)
		(next-flight-to-process beluga106 beluga107)
		(next-flight-to-process beluga107 beluga108)
		(next-flight-to-process beluga108 beluga109)
		(next-flight-to-process beluga109 beluga110)
		(next-flight-to-process beluga110 beluga111)
		(next-flight-to-process beluga111 beluga112)
		(next-flight-to-process beluga112 beluga113)
		(next-flight-to-process beluga113 beluga114)
		(next-flight-to-process beluga114 beluga115)
		(next-flight-to-process beluga115 beluga116)
		(next-flight-to-process beluga116 beluga117)
		(next-flight-to-process beluga117 beluga118)
		(next-flight-to-process beluga118 beluga119)
		(next-flight-to-process beluga119 beluga120)
		(next-flight-to-process beluga120 beluga121)
		(next-flight-to-process beluga121 beluga122)
		(next-flight-to-process beluga122 beluga123)
		(next-flight-to-process beluga123 beluga124)
		(next-flight-to-process beluga124 beluga125)
		(next-flight-to-process beluga125 beluga126)
		(next-flight-to-process beluga126 beluga127)
		(next-flight-to-process beluga127 beluga128)
		(next-flight-to-process beluga128 beluga129)
		(next-flight-to-process beluga129 beluga130)
		(next-flight-to-process beluga130 beluga131)
		(next-flight-to-process beluga131 beluga132)
		(next-flight-to-process beluga132 beluga133)
		(next-flight-to-process beluga133 beluga134)
		(next-flight-to-process beluga134 beluga135)
		(next-flight-to-process beluga135 beluga136)
		(next-flight-to-process beluga136 beluga137)
		(next-flight-to-process beluga137 beluga138)
		(next-flight-to-process beluga138 beluga139)
		(next-flight-to-process beluga139 beluga140)
		(next-flight-to-process beluga140 beluga141)
		(next-flight-to-process beluga141 beluga142)
		(next-flight-to-process beluga142 beluga143)
		(next-flight-to-process beluga143 beluga144)
		(next-flight-to-process beluga144 beluga145)
		(next-flight-to-process beluga145 beluga146)
		(next-flight-to-process beluga146 beluga147)
		(next-flight-to-process beluga147 beluga148)
		(next-flight-to-process beluga148 beluga149)
		(next-flight-to-process beluga149 beluga150)
		(next-flight-to-process beluga150 beluga151)
		(next-flight-to-process beluga151 beluga152)
		(next-flight-to-process beluga152 beluga153)
		(next-flight-to-process beluga153 beluga154)
		(next-flight-to-process beluga154 beluga155)
		(next-flight-to-process beluga155 beluga156)
		(next-flight-to-process beluga156 beluga157)
		(next-flight-to-process beluga157 beluga158)
		(next-flight-to-process beluga158 beluga159)
		(next-flight-to-process beluga159 beluga160)
		(next-flight-to-process beluga160 beluga161)
		(next-flight-to-process beluga161 beluga162)
		(next-flight-to-process beluga162 beluga163)
		(next-flight-to-process beluga163 beluga164)
		(next-flight-to-process beluga164 beluga165)
		(next-flight-to-process beluga165 beluga166)
		(next-flight-to-process beluga166 beluga167)
		(next-flight-to-process beluga167 beluga168)
		(next-flight-to-process beluga168 beluga169)
		(next-flight-to-process beluga169 beluga170)
		(next-flight-to-process beluga170 beluga171)
		(next-flight-to-process beluga171 beluga172)
		(next-flight-to-process beluga172 beluga173)
		; Number of flights: 173
		; Incoming jigs unload order:
		; Finished Flights
		; No already completely finished Flights
		; Current Flight: beluga1
		; 0: jig0009
		(to_unload jig0009 beluga1)
		(in jig0009 beluga1)
		(next_unload jig0009 dummy-jig)
		; To Process Flights
		; Flight: beluga2
		; 0: jig0010
		(to_unload jig0010 beluga2)
		(in jig0010 beluga2)
		(next_unload jig0010 dummy-jig)
		; Flight: beluga3
		; 0: jig0011
		(to_unload jig0011 beluga3)
		(in jig0011 beluga3)
		(next_unload jig0011 dummy-jig)
		; Flight: beluga4
		; 0: jig0012
		(to_unload jig0012 beluga4)
		(in jig0012 beluga4)
		(next_unload jig0012 dummy-jig)
		; Flight: beluga5
		; 0: jig0013 1: jig0014 2: jig0015
		(to_unload jig0013 beluga5)
		(in jig0013 beluga5)
		(next_unload jig0013 jig0014)
		(in jig0014 beluga5)
		(next_unload jig0014 jig0015)
		(in jig0015 beluga5)
		(next_unload jig0015 dummy-jig)
		; Flight: beluga6
		; 0: jig0016
		(to_unload jig0016 beluga6)
		(in jig0016 beluga6)
		(next_unload jig0016 dummy-jig)
		; Flight: beluga7
		; 0: jig0017
		(to_unload jig0017 beluga7)
		(in jig0017 beluga7)
		(next_unload jig0017 dummy-jig)
		; Flight: beluga8
		; 0: jig0018
		(to_unload jig0018 beluga8)
		(in jig0018 beluga8)
		(next_unload jig0018 dummy-jig)
		; Flight: beluga9
		; 0: jig0019 1: jig0020 2: jig0021
		(to_unload jig0019 beluga9)
		(in jig0019 beluga9)
		(next_unload jig0019 jig0020)
		(in jig0020 beluga9)
		(next_unload jig0020 jig0021)
		(in jig0021 beluga9)
		(next_unload jig0021 dummy-jig)
		; Flight: beluga10
		; 0: jig0022
		(to_unload jig0022 beluga10)
		(in jig0022 beluga10)
		(next_unload jig0022 dummy-jig)
		; Flight: beluga11
		; 0: jig0023
		(to_unload jig0023 beluga11)
		(in jig0023 beluga11)
		(next_unload jig0023 dummy-jig)
		; Flight: beluga12
		; 0: jig0024 1: jig0025
		(to_unload jig0024 beluga12)
		(in jig0024 beluga12)
		(next_unload jig0024 jig0025)
		(in jig0025 beluga12)
		(next_unload jig0025 dummy-jig)
		; Flight: beluga13
		; 0: jig0026
		(to_unload jig0026 beluga13)
		(in jig0026 beluga13)
		(next_unload jig0026 dummy-jig)
		; Flight: beluga14
		; 0: jig0027 1: jig0028
		(to_unload jig0027 beluga14)
		(in jig0027 beluga14)
		(next_unload jig0027 jig0028)
		(in jig0028 beluga14)
		(next_unload jig0028 dummy-jig)
		; Flight: beluga15
		; 0: jig0029
		(to_unload jig0029 beluga15)
		(in jig0029 beluga15)
		(next_unload jig0029 dummy-jig)
		; Flight: beluga16
		; 0: jig0030
		(to_unload jig0030 beluga16)
		(in jig0030 beluga16)
		(next_unload jig0030 dummy-jig)
		; Flight: beluga17
		; 0: jig0031
		(to_unload jig0031 beluga17)
		(in jig0031 beluga17)
		(next_unload jig0031 dummy-jig)
		; Flight: beluga18
		; 0: jig0032
		(to_unload jig0032 beluga18)
		(in jig0032 beluga18)
		(next_unload jig0032 dummy-jig)
		; Flight: beluga19
		; 0: jig0033 1: jig0034
		(to_unload jig0033 beluga19)
		(in jig0033 beluga19)
		(next_unload jig0033 jig0034)
		(in jig0034 beluga19)
		(next_unload jig0034 dummy-jig)
		; Flight: beluga20
		; 0: jig0035
		(to_unload jig0035 beluga20)
		(in jig0035 beluga20)
		(next_unload jig0035 dummy-jig)
		; Flight: beluga21
		; 0: jig0036
		(to_unload jig0036 beluga21)
		(in jig0036 beluga21)
		(next_unload jig0036 dummy-jig)
		; Flight: beluga22
		; 0: jig0037 1: jig0038
		(to_unload jig0037 beluga22)
		(in jig0037 beluga22)
		(next_unload jig0037 jig0038)
		(in jig0038 beluga22)
		(next_unload jig0038 dummy-jig)
		; Flight: beluga23
		; 0: jig0039 1: jig0040
		(to_unload jig0039 beluga23)
		(in jig0039 beluga23)
		(next_unload jig0039 jig0040)
		(in jig0040 beluga23)
		(next_unload jig0040 dummy-jig)
		; Flight: beluga24
		; 0: jig0041 1: jig0042 2: jig0043
		(to_unload jig0041 beluga24)
		(in jig0041 beluga24)
		(next_unload jig0041 jig0042)
		(in jig0042 beluga24)
		(next_unload jig0042 jig0043)
		(in jig0043 beluga24)
		(next_unload jig0043 dummy-jig)
		; Flight: beluga25
		; 0: jig0044 1: jig0045 2: jig0046
		(to_unload jig0044 beluga25)
		(in jig0044 beluga25)
		(next_unload jig0044 jig0045)
		(in jig0045 beluga25)
		(next_unload jig0045 jig0046)
		(in jig0046 beluga25)
		(next_unload jig0046 dummy-jig)
		; Flight: beluga26
		; 0: jig0047 1: jig0048 2: jig0049
		(to_unload jig0047 beluga26)
		(in jig0047 beluga26)
		(next_unload jig0047 jig0048)
		(in jig0048 beluga26)
		(next_unload jig0048 jig0049)
		(in jig0049 beluga26)
		(next_unload jig0049 dummy-jig)
		; Flight: beluga27
		; 0: jig0050 1: jig0051 2: jig0052
		(to_unload jig0050 beluga27)
		(in jig0050 beluga27)
		(next_unload jig0050 jig0051)
		(in jig0051 beluga27)
		(next_unload jig0051 jig0052)
		(in jig0052 beluga27)
		(next_unload jig0052 dummy-jig)
		; Flight: beluga28
		; 0: jig0053
		(to_unload jig0053 beluga28)
		(in jig0053 beluga28)
		(next_unload jig0053 dummy-jig)
		; Flight: beluga29
		; No jigs
		(to_unload dummy-jig beluga29)
		; Flight: beluga30
		; 0: jig0054 1: jig0055 2: jig0056
		(to_unload jig0054 beluga30)
		(in jig0054 beluga30)
		(next_unload jig0054 jig0055)
		(in jig0055 beluga30)
		(next_unload jig0055 jig0056)
		(in jig0056 beluga30)
		(next_unload jig0056 dummy-jig)
		; Flight: beluga31
		; 0: jig0057
		(to_unload jig0057 beluga31)
		(in jig0057 beluga31)
		(next_unload jig0057 dummy-jig)
		; Flight: beluga32
		; No jigs
		(to_unload dummy-jig beluga32)
		; Flight: beluga33
		; 0: jig0058
		(to_unload jig0058 beluga33)
		(in jig0058 beluga33)
		(next_unload jig0058 dummy-jig)
		; Flight: beluga34
		; 0: jig0059 1: jig0060
		(to_unload jig0059 beluga34)
		(in jig0059 beluga34)
		(next_unload jig0059 jig0060)
		(in jig0060 beluga34)
		(next_unload jig0060 dummy-jig)
		; Flight: beluga35
		; 0: jig0061
		(to_unload jig0061 beluga35)
		(in jig0061 beluga35)
		(next_unload jig0061 dummy-jig)
		; Flight: beluga36
		; 0: jig0062 1: jig0063 2: jig0064
		(to_unload jig0062 beluga36)
		(in jig0062 beluga36)
		(next_unload jig0062 jig0063)
		(in jig0063 beluga36)
		(next_unload jig0063 jig0064)
		(in jig0064 beluga36)
		(next_unload jig0064 dummy-jig)
		; Flight: beluga37
		; 0: jig0065 1: jig0066
		(to_unload jig0065 beluga37)
		(in jig0065 beluga37)
		(next_unload jig0065 jig0066)
		(in jig0066 beluga37)
		(next_unload jig0066 dummy-jig)
		; Flight: beluga38
		; No jigs
		(to_unload dummy-jig beluga38)
		; Flight: beluga39
		; 0: jig0067
		(to_unload jig0067 beluga39)
		(in jig0067 beluga39)
		(next_unload jig0067 dummy-jig)
		; Flight: beluga40
		; No jigs
		(to_unload dummy-jig beluga40)
		; Flight: beluga41
		; 0: jig0068
		(to_unload jig0068 beluga41)
		(in jig0068 beluga41)
		(next_unload jig0068 dummy-jig)
		; Flight: beluga42
		; No jigs
		(to_unload dummy-jig beluga42)
		; Flight: beluga43
		; 0: jig0069 1: jig0070 2: jig0071 3: jig0072 4: jig0073 5: jig0074 6: jig0075 7: jig0076 8: jig0077 9: jig0078
		(to_unload jig0069 beluga43)
		(in jig0069 beluga43)
		(next_unload jig0069 jig0070)
		(in jig0070 beluga43)
		(next_unload jig0070 jig0071)
		(in jig0071 beluga43)
		(next_unload jig0071 jig0072)
		(in jig0072 beluga43)
		(next_unload jig0072 jig0073)
		(in jig0073 beluga43)
		(next_unload jig0073 jig0074)
		(in jig0074 beluga43)
		(next_unload jig0074 jig0075)
		(in jig0075 beluga43)
		(next_unload jig0075 jig0076)
		(in jig0076 beluga43)
		(next_unload jig0076 jig0077)
		(in jig0077 beluga43)
		(next_unload jig0077 jig0078)
		(in jig0078 beluga43)
		(next_unload jig0078 dummy-jig)
		; Flight: beluga44
		; 0: jig0079
		(to_unload jig0079 beluga44)
		(in jig0079 beluga44)
		(next_unload jig0079 dummy-jig)
		; Flight: beluga45
		; 0: jig0080
		(to_unload jig0080 beluga45)
		(in jig0080 beluga45)
		(next_unload jig0080 dummy-jig)
		; Flight: beluga46
		; 0: jig0081 1: jig0082 2: jig0083
		(to_unload jig0081 beluga46)
		(in jig0081 beluga46)
		(next_unload jig0081 jig0082)
		(in jig0082 beluga46)
		(next_unload jig0082 jig0083)
		(in jig0083 beluga46)
		(next_unload jig0083 dummy-jig)
		; Flight: beluga47
		; 0: jig0084
		(to_unload jig0084 beluga47)
		(in jig0084 beluga47)
		(next_unload jig0084 dummy-jig)
		; Flight: beluga48
		; No jigs
		(to_unload dummy-jig beluga48)
		; Flight: beluga49
		; 0: jig0085
		(to_unload jig0085 beluga49)
		(in jig0085 beluga49)
		(next_unload jig0085 dummy-jig)
		; Flight: beluga50
		; No jigs
		(to_unload dummy-jig beluga50)
		; Flight: beluga51
		; No jigs
		(to_unload dummy-jig beluga51)
		; Flight: beluga52
		; 0: jig0086 1: jig0087
		(to_unload jig0086 beluga52)
		(in jig0086 beluga52)
		(next_unload jig0086 jig0087)
		(in jig0087 beluga52)
		(next_unload jig0087 dummy-jig)
		; Flight: beluga53
		; 0: jig0088
		(to_unload jig0088 beluga53)
		(in jig0088 beluga53)
		(next_unload jig0088 dummy-jig)
		; Flight: beluga54
		; No jigs
		(to_unload dummy-jig beluga54)
		; Flight: beluga55
		; 0: jig0089
		(to_unload jig0089 beluga55)
		(in jig0089 beluga55)
		(next_unload jig0089 dummy-jig)
		; Flight: beluga56
		; 0: jig0090 1: jig0091 2: jig0092
		(to_unload jig0090 beluga56)
		(in jig0090 beluga56)
		(next_unload jig0090 jig0091)
		(in jig0091 beluga56)
		(next_unload jig0091 jig0092)
		(in jig0092 beluga56)
		(next_unload jig0092 dummy-jig)
		; Flight: beluga57
		; 0: jig0093 1: jig0094 2: jig0095 3: jig0096 4: jig0097 5: jig0098 6: jig0099 7: jig0100 8: jig0101 9: jig0102
		(to_unload jig0093 beluga57)
		(in jig0093 beluga57)
		(next_unload jig0093 jig0094)
		(in jig0094 beluga57)
		(next_unload jig0094 jig0095)
		(in jig0095 beluga57)
		(next_unload jig0095 jig0096)
		(in jig0096 beluga57)
		(next_unload jig0096 jig0097)
		(in jig0097 beluga57)
		(next_unload jig0097 jig0098)
		(in jig0098 beluga57)
		(next_unload jig0098 jig0099)
		(in jig0099 beluga57)
		(next_unload jig0099 jig0100)
		(in jig0100 beluga57)
		(next_unload jig0100 jig0101)
		(in jig0101 beluga57)
		(next_unload jig0101 jig0102)
		(in jig0102 beluga57)
		(next_unload jig0102 dummy-jig)
		; Flight: beluga58
		; 0: jig0103
		(to_unload jig0103 beluga58)
		(in jig0103 beluga58)
		(next_unload jig0103 dummy-jig)
		; Flight: beluga59
		; 0: jig0104 1: jig0105 2: jig0106
		(to_unload jig0104 beluga59)
		(in jig0104 beluga59)
		(next_unload jig0104 jig0105)
		(in jig0105 beluga59)
		(next_unload jig0105 jig0106)
		(in jig0106 beluga59)
		(next_unload jig0106 dummy-jig)
		; Flight: beluga60
		; 0: jig0107
		(to_unload jig0107 beluga60)
		(in jig0107 beluga60)
		(next_unload jig0107 dummy-jig)
		; Flight: beluga61
		; No jigs
		(to_unload dummy-jig beluga61)
		; Flight: beluga62
		; No jigs
		(to_unload dummy-jig beluga62)
		; Flight: beluga63
		; 0: jig0108
		(to_unload jig0108 beluga63)
		(in jig0108 beluga63)
		(next_unload jig0108 dummy-jig)
		; Flight: beluga64
		; No jigs
		(to_unload dummy-jig beluga64)
		; Flight: beluga65
		; No jigs
		(to_unload dummy-jig beluga65)
		; Flight: beluga66
		; 0: jig0109
		(to_unload jig0109 beluga66)
		(in jig0109 beluga66)
		(next_unload jig0109 dummy-jig)
		; Flight: beluga67
		; 0: jig0110 1: jig0111 2: jig0112
		(to_unload jig0110 beluga67)
		(in jig0110 beluga67)
		(next_unload jig0110 jig0111)
		(in jig0111 beluga67)
		(next_unload jig0111 jig0112)
		(in jig0112 beluga67)
		(next_unload jig0112 dummy-jig)
		; Flight: beluga68
		; 0: jig0113
		(to_unload jig0113 beluga68)
		(in jig0113 beluga68)
		(next_unload jig0113 dummy-jig)
		; Flight: beluga69
		; No jigs
		(to_unload dummy-jig beluga69)
		; Flight: beluga70
		; 0: jig0114 1: jig0115 2: jig0116 3: jig0117 4: jig0118 5: jig0119 6: jig0120 7: jig0121 8: jig0122 9: jig0123
		(to_unload jig0114 beluga70)
		(in jig0114 beluga70)
		(next_unload jig0114 jig0115)
		(in jig0115 beluga70)
		(next_unload jig0115 jig0116)
		(in jig0116 beluga70)
		(next_unload jig0116 jig0117)
		(in jig0117 beluga70)
		(next_unload jig0117 jig0118)
		(in jig0118 beluga70)
		(next_unload jig0118 jig0119)
		(in jig0119 beluga70)
		(next_unload jig0119 jig0120)
		(in jig0120 beluga70)
		(next_unload jig0120 jig0121)
		(in jig0121 beluga70)
		(next_unload jig0121 jig0122)
		(in jig0122 beluga70)
		(next_unload jig0122 jig0123)
		(in jig0123 beluga70)
		(next_unload jig0123 dummy-jig)
		; Flight: beluga71
		; 0: jig0124 1: jig0125 2: jig0126 3: jig0127 4: jig0128 5: jig0129 6: jig0130
		(to_unload jig0124 beluga71)
		(in jig0124 beluga71)
		(next_unload jig0124 jig0125)
		(in jig0125 beluga71)
		(next_unload jig0125 jig0126)
		(in jig0126 beluga71)
		(next_unload jig0126 jig0127)
		(in jig0127 beluga71)
		(next_unload jig0127 jig0128)
		(in jig0128 beluga71)
		(next_unload jig0128 jig0129)
		(in jig0129 beluga71)
		(next_unload jig0129 jig0130)
		(in jig0130 beluga71)
		(next_unload jig0130 dummy-jig)
		; Flight: beluga72
		; 0: jig0131 1: jig0132 2: jig0133 3: jig0134 4: jig0135
		(to_unload jig0131 beluga72)
		(in jig0131 beluga72)
		(next_unload jig0131 jig0132)
		(in jig0132 beluga72)
		(next_unload jig0132 jig0133)
		(in jig0133 beluga72)
		(next_unload jig0133 jig0134)
		(in jig0134 beluga72)
		(next_unload jig0134 jig0135)
		(in jig0135 beluga72)
		(next_unload jig0135 dummy-jig)
		; Flight: beluga73
		; No jigs
		(to_unload dummy-jig beluga73)
		; Flight: beluga74
		; No jigs
		(to_unload dummy-jig beluga74)
		; Flight: beluga75
		; No jigs
		(to_unload dummy-jig beluga75)
		; Flight: beluga76
		; No jigs
		(to_unload dummy-jig beluga76)
		; Flight: beluga77
		; 0: jig0136 1: jig0137
		(to_unload jig0136 beluga77)
		(in jig0136 beluga77)
		(next_unload jig0136 jig0137)
		(in jig0137 beluga77)
		(next_unload jig0137 dummy-jig)
		; Flight: beluga78
		; No jigs
		(to_unload dummy-jig beluga78)
		; Flight: beluga79
		; No jigs
		(to_unload dummy-jig beluga79)
		; Flight: beluga80
		; No jigs
		(to_unload dummy-jig beluga80)
		; Flight: beluga81
		; No jigs
		(to_unload dummy-jig beluga81)
		; Flight: beluga82
		; 0: jig0138 1: jig0139 2: jig0140
		(to_unload jig0138 beluga82)
		(in jig0138 beluga82)
		(next_unload jig0138 jig0139)
		(in jig0139 beluga82)
		(next_unload jig0139 jig0140)
		(in jig0140 beluga82)
		(next_unload jig0140 dummy-jig)
		; Flight: beluga83
		; 0: jig0141 1: jig0142
		(to_unload jig0141 beluga83)
		(in jig0141 beluga83)
		(next_unload jig0141 jig0142)
		(in jig0142 beluga83)
		(next_unload jig0142 dummy-jig)
		; Flight: beluga84
		; 0: jig0143
		(to_unload jig0143 beluga84)
		(in jig0143 beluga84)
		(next_unload jig0143 dummy-jig)
		; Flight: beluga85
		; No jigs
		(to_unload dummy-jig beluga85)
		; Flight: beluga86
		; No jigs
		(to_unload dummy-jig beluga86)
		; Flight: beluga87
		; 0: jig0144 1: jig0145
		(to_unload jig0144 beluga87)
		(in jig0144 beluga87)
		(next_unload jig0144 jig0145)
		(in jig0145 beluga87)
		(next_unload jig0145 dummy-jig)
		; Flight: beluga88
		; 0: jig0146 1: jig0147
		(to_unload jig0146 beluga88)
		(in jig0146 beluga88)
		(next_unload jig0146 jig0147)
		(in jig0147 beluga88)
		(next_unload jig0147 dummy-jig)
		; Flight: beluga89
		; 0: jig0148 1: jig0149 2: jig0150
		(to_unload jig0148 beluga89)
		(in jig0148 beluga89)
		(next_unload jig0148 jig0149)
		(in jig0149 beluga89)
		(next_unload jig0149 jig0150)
		(in jig0150 beluga89)
		(next_unload jig0150 dummy-jig)
		; Flight: beluga90
		; 0: jig0151
		(to_unload jig0151 beluga90)
		(in jig0151 beluga90)
		(next_unload jig0151 dummy-jig)
		; Flight: beluga91
		; No jigs
		(to_unload dummy-jig beluga91)
		; Flight: beluga92
		; No jigs
		(to_unload dummy-jig beluga92)
		; Flight: beluga93
		; No jigs
		(to_unload dummy-jig beluga93)
		; Flight: beluga94
		; No jigs
		(to_unload dummy-jig beluga94)
		; Flight: beluga95
		; No jigs
		(to_unload dummy-jig beluga95)
		; Flight: beluga96
		; 0: jig0152 1: jig0153 2: jig0154
		(to_unload jig0152 beluga96)
		(in jig0152 beluga96)
		(next_unload jig0152 jig0153)
		(in jig0153 beluga96)
		(next_unload jig0153 jig0154)
		(in jig0154 beluga96)
		(next_unload jig0154 dummy-jig)
		; Flight: beluga97
		; 0: jig0155
		(to_unload jig0155 beluga97)
		(in jig0155 beluga97)
		(next_unload jig0155 dummy-jig)
		; Flight: beluga98
		; 0: jig0156 1: jig0157 2: jig0158 3: jig0159 4: jig0160 5: jig0161 6: jig0162 7: jig0163 8: jig0164 9: jig0165
		(to_unload jig0156 beluga98)
		(in jig0156 beluga98)
		(next_unload jig0156 jig0157)
		(in jig0157 beluga98)
		(next_unload jig0157 jig0158)
		(in jig0158 beluga98)
		(next_unload jig0158 jig0159)
		(in jig0159 beluga98)
		(next_unload jig0159 jig0160)
		(in jig0160 beluga98)
		(next_unload jig0160 jig0161)
		(in jig0161 beluga98)
		(next_unload jig0161 jig0162)
		(in jig0162 beluga98)
		(next_unload jig0162 jig0163)
		(in jig0163 beluga98)
		(next_unload jig0163 jig0164)
		(in jig0164 beluga98)
		(next_unload jig0164 jig0165)
		(in jig0165 beluga98)
		(next_unload jig0165 dummy-jig)
		; Flight: beluga99
		; 0: jig0166
		(to_unload jig0166 beluga99)
		(in jig0166 beluga99)
		(next_unload jig0166 dummy-jig)
		; Flight: beluga100
		; No jigs
		(to_unload dummy-jig beluga100)
		; Flight: beluga101
		; No jigs
		(to_unload dummy-jig beluga101)
		; Flight: beluga102
		; No jigs
		(to_unload dummy-jig beluga102)
		; Flight: beluga103
		; 0: jig0167 1: jig0168 2: jig0169 3: jig0170 4: jig0171 5: jig0172 6: jig0173 7: jig0174 8: jig0175 9: jig0176
		(to_unload jig0167 beluga103)
		(in jig0167 beluga103)
		(next_unload jig0167 jig0168)
		(in jig0168 beluga103)
		(next_unload jig0168 jig0169)
		(in jig0169 beluga103)
		(next_unload jig0169 jig0170)
		(in jig0170 beluga103)
		(next_unload jig0170 jig0171)
		(in jig0171 beluga103)
		(next_unload jig0171 jig0172)
		(in jig0172 beluga103)
		(next_unload jig0172 jig0173)
		(in jig0173 beluga103)
		(next_unload jig0173 jig0174)
		(in jig0174 beluga103)
		(next_unload jig0174 jig0175)
		(in jig0175 beluga103)
		(next_unload jig0175 jig0176)
		(in jig0176 beluga103)
		(next_unload jig0176 dummy-jig)
		; Flight: beluga104
		; No jigs
		(to_unload dummy-jig beluga104)
		; Flight: beluga105
		; 0: jig0177
		(to_unload jig0177 beluga105)
		(in jig0177 beluga105)
		(next_unload jig0177 dummy-jig)
		; Flight: beluga106
		; No jigs
		(to_unload dummy-jig beluga106)
		; Flight: beluga107
		; No jigs
		(to_unload dummy-jig beluga107)
		; Flight: beluga108
		; No jigs
		(to_unload dummy-jig beluga108)
		; Flight: beluga109
		; 0: jig0178
		(to_unload jig0178 beluga109)
		(in jig0178 beluga109)
		(next_unload jig0178 dummy-jig)
		; Flight: beluga110
		; No jigs
		(to_unload dummy-jig beluga110)
		; Flight: beluga111
		; 0: jig0179 1: jig0180
		(to_unload jig0179 beluga111)
		(in jig0179 beluga111)
		(next_unload jig0179 jig0180)
		(in jig0180 beluga111)
		(next_unload jig0180 dummy-jig)
		; Flight: beluga112
		; 0: jig0181
		(to_unload jig0181 beluga112)
		(in jig0181 beluga112)
		(next_unload jig0181 dummy-jig)
		; Flight: beluga113
		; No jigs
		(to_unload dummy-jig beluga113)
		; Flight: beluga114
		; 0: jig0182 1: jig0183 2: jig0184
		(to_unload jig0182 beluga114)
		(in jig0182 beluga114)
		(next_unload jig0182 jig0183)
		(in jig0183 beluga114)
		(next_unload jig0183 jig0184)
		(in jig0184 beluga114)
		(next_unload jig0184 dummy-jig)
		; Flight: beluga115
		; 0: jig0185 1: jig0186 2: jig0187
		(to_unload jig0185 beluga115)
		(in jig0185 beluga115)
		(next_unload jig0185 jig0186)
		(in jig0186 beluga115)
		(next_unload jig0186 jig0187)
		(in jig0187 beluga115)
		(next_unload jig0187 dummy-jig)
		; Flight: beluga116
		; 0: jig0188
		(to_unload jig0188 beluga116)
		(in jig0188 beluga116)
		(next_unload jig0188 dummy-jig)
		; Flight: beluga117
		; No jigs
		(to_unload dummy-jig beluga117)
		; Flight: beluga118
		; No jigs
		(to_unload dummy-jig beluga118)
		; Flight: beluga119
		; No jigs
		(to_unload dummy-jig beluga119)
		; Flight: beluga120
		; No jigs
		(to_unload dummy-jig beluga120)
		; Flight: beluga121
		; 0: jig0189 1: jig0190 2: jig0191
		(to_unload jig0189 beluga121)
		(in jig0189 beluga121)
		(next_unload jig0189 jig0190)
		(in jig0190 beluga121)
		(next_unload jig0190 jig0191)
		(in jig0191 beluga121)
		(next_unload jig0191 dummy-jig)
		; Flight: beluga122
		; No jigs
		(to_unload dummy-jig beluga122)
		; Flight: beluga123
		; 0: jig0192
		(to_unload jig0192 beluga123)
		(in jig0192 beluga123)
		(next_unload jig0192 dummy-jig)
		; Flight: beluga124
		; No jigs
		(to_unload dummy-jig beluga124)
		; Flight: beluga125
		; 0: jig0193 1: jig0194 2: jig0195
		(to_unload jig0193 beluga125)
		(in jig0193 beluga125)
		(next_unload jig0193 jig0194)
		(in jig0194 beluga125)
		(next_unload jig0194 jig0195)
		(in jig0195 beluga125)
		(next_unload jig0195 dummy-jig)
		; Flight: beluga126
		; 0: jig0196 1: jig0197
		(to_unload jig0196 beluga126)
		(in jig0196 beluga126)
		(next_unload jig0196 jig0197)
		(in jig0197 beluga126)
		(next_unload jig0197 dummy-jig)
		; Flight: beluga127
		; 0: jig0198 1: jig0199
		(to_unload jig0198 beluga127)
		(in jig0198 beluga127)
		(next_unload jig0198 jig0199)
		(in jig0199 beluga127)
		(next_unload jig0199 dummy-jig)
		; Flight: beluga128
		; 0: jig0200
		(to_unload jig0200 beluga128)
		(in jig0200 beluga128)
		(next_unload jig0200 dummy-jig)
		; Flight: beluga129
		; 0: jig0201
		(to_unload jig0201 beluga129)
		(in jig0201 beluga129)
		(next_unload jig0201 dummy-jig)
		; Flight: beluga130
		; 0: jig0202 1: jig0203
		(to_unload jig0202 beluga130)
		(in jig0202 beluga130)
		(next_unload jig0202 jig0203)
		(in jig0203 beluga130)
		(next_unload jig0203 dummy-jig)
		; Flight: beluga131
		; No jigs
		(to_unload dummy-jig beluga131)
		; Flight: beluga132
		; 0: jig0204 1: jig0205 2: jig0206 3: jig0207 4: jig0208 5: jig0209 6: jig0210 7: jig0211 8: jig0212 9: jig0213
		(to_unload jig0204 beluga132)
		(in jig0204 beluga132)
		(next_unload jig0204 jig0205)
		(in jig0205 beluga132)
		(next_unload jig0205 jig0206)
		(in jig0206 beluga132)
		(next_unload jig0206 jig0207)
		(in jig0207 beluga132)
		(next_unload jig0207 jig0208)
		(in jig0208 beluga132)
		(next_unload jig0208 jig0209)
		(in jig0209 beluga132)
		(next_unload jig0209 jig0210)
		(in jig0210 beluga132)
		(next_unload jig0210 jig0211)
		(in jig0211 beluga132)
		(next_unload jig0211 jig0212)
		(in jig0212 beluga132)
		(next_unload jig0212 jig0213)
		(in jig0213 beluga132)
		(next_unload jig0213 dummy-jig)
		; Flight: beluga133
		; 0: jig0214 1: jig0215 2: jig0216 3: jig0217 4: jig0218 5: jig0219 6: jig0220 7: jig0221 8: jig0222 9: jig0223
		(to_unload jig0214 beluga133)
		(in jig0214 beluga133)
		(next_unload jig0214 jig0215)
		(in jig0215 beluga133)
		(next_unload jig0215 jig0216)
		(in jig0216 beluga133)
		(next_unload jig0216 jig0217)
		(in jig0217 beluga133)
		(next_unload jig0217 jig0218)
		(in jig0218 beluga133)
		(next_unload jig0218 jig0219)
		(in jig0219 beluga133)
		(next_unload jig0219 jig0220)
		(in jig0220 beluga133)
		(next_unload jig0220 jig0221)
		(in jig0221 beluga133)
		(next_unload jig0221 jig0222)
		(in jig0222 beluga133)
		(next_unload jig0222 jig0223)
		(in jig0223 beluga133)
		(next_unload jig0223 dummy-jig)
		; Flight: beluga134
		; 0: jig0224 1: jig0225
		(to_unload jig0224 beluga134)
		(in jig0224 beluga134)
		(next_unload jig0224 jig0225)
		(in jig0225 beluga134)
		(next_unload jig0225 dummy-jig)
		; Flight: beluga135
		; 0: jig0226
		(to_unload jig0226 beluga135)
		(in jig0226 beluga135)
		(next_unload jig0226 dummy-jig)
		; Flight: beluga136
		; No jigs
		(to_unload dummy-jig beluga136)
		; Flight: beluga137
		; 0: jig0227 1: jig0228
		(to_unload jig0227 beluga137)
		(in jig0227 beluga137)
		(next_unload jig0227 jig0228)
		(in jig0228 beluga137)
		(next_unload jig0228 dummy-jig)
		; Flight: beluga138
		; 0: jig0229
		(to_unload jig0229 beluga138)
		(in jig0229 beluga138)
		(next_unload jig0229 dummy-jig)
		; Flight: beluga139
		; 0: jig0230 1: jig0231 2: jig0232
		(to_unload jig0230 beluga139)
		(in jig0230 beluga139)
		(next_unload jig0230 jig0231)
		(in jig0231 beluga139)
		(next_unload jig0231 jig0232)
		(in jig0232 beluga139)
		(next_unload jig0232 dummy-jig)
		; Flight: beluga140
		; No jigs
		(to_unload dummy-jig beluga140)
		; Flight: beluga141
		; 0: jig0233
		(to_unload jig0233 beluga141)
		(in jig0233 beluga141)
		(next_unload jig0233 dummy-jig)
		; Flight: beluga142
		; No jigs
		(to_unload dummy-jig beluga142)
		; Flight: beluga143
		; 0: jig0234
		(to_unload jig0234 beluga143)
		(in jig0234 beluga143)
		(next_unload jig0234 dummy-jig)
		; Flight: beluga144
		; No jigs
		(to_unload dummy-jig beluga144)
		; Flight: beluga145
		; No jigs
		(to_unload dummy-jig beluga145)
		; Flight: beluga146
		; 0: jig0235
		(to_unload jig0235 beluga146)
		(in jig0235 beluga146)
		(next_unload jig0235 dummy-jig)
		; Flight: beluga147
		; No jigs
		(to_unload dummy-jig beluga147)
		; Flight: beluga148
		; No jigs
		(to_unload dummy-jig beluga148)
		; Flight: beluga149
		; 0: jig0236
		(to_unload jig0236 beluga149)
		(in jig0236 beluga149)
		(next_unload jig0236 dummy-jig)
		; Flight: beluga150
		; No jigs
		(to_unload dummy-jig beluga150)
		; Flight: beluga151
		; 0: jig0237
		(to_unload jig0237 beluga151)
		(in jig0237 beluga151)
		(next_unload jig0237 dummy-jig)
		; Flight: beluga152
		; 0: jig0238 1: jig0239 2: jig0240
		(to_unload jig0238 beluga152)
		(in jig0238 beluga152)
		(next_unload jig0238 jig0239)
		(in jig0239 beluga152)
		(next_unload jig0239 jig0240)
		(in jig0240 beluga152)
		(next_unload jig0240 dummy-jig)
		; Flight: beluga153
		; No jigs
		(to_unload dummy-jig beluga153)
		; Flight: beluga154
		; 0: jig0241
		(to_unload jig0241 beluga154)
		(in jig0241 beluga154)
		(next_unload jig0241 dummy-jig)
		; Flight: beluga155
		; 0: jig0242 1: jig0243
		(to_unload jig0242 beluga155)
		(in jig0242 beluga155)
		(next_unload jig0242 jig0243)
		(in jig0243 beluga155)
		(next_unload jig0243 dummy-jig)
		; Flight: beluga156
		; 0: jig0244 1: jig0245
		(to_unload jig0244 beluga156)
		(in jig0244 beluga156)
		(next_unload jig0244 jig0245)
		(in jig0245 beluga156)
		(next_unload jig0245 dummy-jig)
		; Flight: beluga157
		; No jigs
		(to_unload dummy-jig beluga157)
		; Flight: beluga158
		; 0: jig0246
		(to_unload jig0246 beluga158)
		(in jig0246 beluga158)
		(next_unload jig0246 dummy-jig)
		; Flight: beluga159
		; 0: jig0247
		(to_unload jig0247 beluga159)
		(in jig0247 beluga159)
		(next_unload jig0247 dummy-jig)
		; Flight: beluga160
		; No jigs
		(to_unload dummy-jig beluga160)
		; Flight: beluga161
		; 0: jig0248 1: jig0249 2: jig0250
		(to_unload jig0248 beluga161)
		(in jig0248 beluga161)
		(next_unload jig0248 jig0249)
		(in jig0249 beluga161)
		(next_unload jig0249 jig0250)
		(in jig0250 beluga161)
		(next_unload jig0250 dummy-jig)
		; Flight: beluga162
		; 0: jig0251
		(to_unload jig0251 beluga162)
		(in jig0251 beluga162)
		(next_unload jig0251 dummy-jig)
		; Flight: beluga163
		; 0: jig0252 1: jig0253 2: jig0254
		(to_unload jig0252 beluga163)
		(in jig0252 beluga163)
		(next_unload jig0252 jig0253)
		(in jig0253 beluga163)
		(next_unload jig0253 jig0254)
		(in jig0254 beluga163)
		(next_unload jig0254 dummy-jig)
		; Flight: beluga164
		; 0: jig0255
		(to_unload jig0255 beluga164)
		(in jig0255 beluga164)
		(next_unload jig0255 dummy-jig)
		; Flight: beluga165
		; 0: jig0256
		(to_unload jig0256 beluga165)
		(in jig0256 beluga165)
		(next_unload jig0256 dummy-jig)
		; Flight: beluga166
		; 0: jig0257
		(to_unload jig0257 beluga166)
		(in jig0257 beluga166)
		(next_unload jig0257 dummy-jig)
		; Flight: beluga167
		; 0: jig0258 1: jig0259
		(to_unload jig0258 beluga167)
		(in jig0258 beluga167)
		(next_unload jig0258 jig0259)
		(in jig0259 beluga167)
		(next_unload jig0259 dummy-jig)
		; Flight: beluga168
		; 0: jig0260 1: jig0261
		(to_unload jig0260 beluga168)
		(in jig0260 beluga168)
		(next_unload jig0260 jig0261)
		(in jig0261 beluga168)
		(next_unload jig0261 dummy-jig)
		; Flight: beluga169
		; 0: jig0262
		(to_unload jig0262 beluga169)
		(in jig0262 beluga169)
		(next_unload jig0262 dummy-jig)
		; Flight: beluga170
		; 0: jig0263
		(to_unload jig0263 beluga170)
		(in jig0263 beluga170)
		(next_unload jig0263 dummy-jig)
		; Flight: beluga171
		; 0: jig0264 1: jig0265
		(to_unload jig0264 beluga171)
		(in jig0264 beluga171)
		(next_unload jig0264 jig0265)
		(in jig0265 beluga171)
		(next_unload jig0265 dummy-jig)
		; Flight: beluga172
		; No jigs
		(to_unload dummy-jig beluga172)
		; Flight: beluga173
		; 0: jig0266
		(to_unload jig0266 beluga173)
		(in jig0266 beluga173)
		(next_unload jig0266 dummy-jig)
		; Outgoing jigs load order:
		; Finished Flights
		; No already completely finished Flights
		; Current Flight: beluga1
		; (0: typeC) (1: typeC) (2: typeC) (3: typeC)
		(to_load typeC slot0 beluga1)
		(next_load typeC slot0 slot1 beluga1)
		(next_load typeC slot1 slot2 beluga1)
		(next_load typeC slot2 slot3 beluga1)
		(next_load dummy-type slot3 dummy-slot beluga1)
		; To Process Flights
		; No jigs
		(to_load dummy-type dummy-slot beluga2)
		; No jigs
		(to_load dummy-type dummy-slot beluga3)
		; No jigs
		(to_load dummy-type dummy-slot beluga4)
		; 0: typeC
		(to_load typeC slot0 beluga5)
		(next_load dummy-type slot0 dummy-slot beluga5)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga6)
		(next_load typeD slot0 slot1 beluga6)
		(next_load dummy-type slot1 dummy-slot beluga6)
		; No jigs
		(to_load dummy-type dummy-slot beluga7)
		; 0: typeB
		(to_load typeB slot0 beluga8)
		(next_load dummy-type slot0 dummy-slot beluga8)
		; 0: typeB
		(to_load typeB slot0 beluga9)
		(next_load dummy-type slot0 dummy-slot beluga9)
		; No jigs
		(to_load dummy-type dummy-slot beluga10)
		; No jigs
		(to_load dummy-type dummy-slot beluga11)
		; 0: typeE
		(to_load typeE slot0 beluga12)
		(next_load dummy-type slot0 dummy-slot beluga12)
		; No jigs
		(to_load dummy-type dummy-slot beluga13)
		; 0: typeE
		(to_load typeE slot0 beluga14)
		(next_load dummy-type slot0 dummy-slot beluga14)
		; 0: typeC
		(to_load typeC slot0 beluga15)
		(next_load dummy-type slot0 dummy-slot beluga15)
		; 0: typeE
		(to_load typeE slot0 beluga16)
		(next_load dummy-type slot0 dummy-slot beluga16)
		; 0: typeB
		(to_load typeB slot0 beluga17)
		(next_load dummy-type slot0 dummy-slot beluga17)
		; 0: typeB
		(to_load typeB slot0 beluga18)
		(next_load dummy-type slot0 dummy-slot beluga18)
		; 0: typeC
		(to_load typeC slot0 beluga19)
		(next_load dummy-type slot0 dummy-slot beluga19)
		; 0: typeE
		(to_load typeE slot0 beluga20)
		(next_load dummy-type slot0 dummy-slot beluga20)
		; 0: typeC
		(to_load typeC slot0 beluga21)
		(next_load dummy-type slot0 dummy-slot beluga21)
		; 0: typeD
		(to_load typeD slot0 beluga22)
		(next_load dummy-type slot0 dummy-slot beluga22)
		; 0: typeC
		(to_load typeC slot0 beluga23)
		(next_load dummy-type slot0 dummy-slot beluga23)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga24)
		(next_load typeB slot0 slot1 beluga24)
		(next_load dummy-type slot1 dummy-slot beluga24)
		; 0: typeC
		(to_load typeC slot0 beluga25)
		(next_load dummy-type slot0 dummy-slot beluga25)
		; 0: typeB
		(to_load typeB slot0 beluga26)
		(next_load dummy-type slot0 dummy-slot beluga26)
		; 0: typeD
		(to_load typeD slot0 beluga27)
		(next_load dummy-type slot0 dummy-slot beluga27)
		; 0: typeE
		(to_load typeE slot0 beluga28)
		(next_load dummy-type slot0 dummy-slot beluga28)
		; 0: typeC
		(to_load typeC slot0 beluga29)
		(next_load dummy-type slot0 dummy-slot beluga29)
		; 0: typeC
		(to_load typeC slot0 beluga30)
		(next_load dummy-type slot0 dummy-slot beluga30)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga31)
		(next_load typeD slot0 slot1 beluga31)
		(next_load dummy-type slot1 dummy-slot beluga31)
		; 0: typeB
		(to_load typeB slot0 beluga32)
		(next_load dummy-type slot0 dummy-slot beluga32)
		; 0: typeC
		(to_load typeC slot0 beluga33)
		(next_load dummy-type slot0 dummy-slot beluga33)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga34)
		(next_load typeB slot0 slot1 beluga34)
		(next_load dummy-type slot1 dummy-slot beluga34)
		; 0: typeE
		(to_load typeE slot0 beluga35)
		(next_load dummy-type slot0 dummy-slot beluga35)
		; 0: typeE
		(to_load typeE slot0 beluga36)
		(next_load dummy-type slot0 dummy-slot beluga36)
		; 0: typeB
		(to_load typeB slot0 beluga37)
		(next_load dummy-type slot0 dummy-slot beluga37)
		; 0: typeB
		(to_load typeB slot0 beluga38)
		(next_load dummy-type slot0 dummy-slot beluga38)
		; 0: typeC
		(to_load typeC slot0 beluga39)
		(next_load dummy-type slot0 dummy-slot beluga39)
		; 0: typeB
		(to_load typeB slot0 beluga40)
		(next_load dummy-type slot0 dummy-slot beluga40)
		; 0: typeC
		(to_load typeC slot0 beluga41)
		(next_load dummy-type slot0 dummy-slot beluga41)
		; 0: typeC
		(to_load typeC slot0 beluga42)
		(next_load dummy-type slot0 dummy-slot beluga42)
		; 0: typeB 1: typeB 2: typeB
		(to_load typeB slot0 beluga43)
		(next_load typeB slot0 slot1 beluga43)
		(next_load typeB slot1 slot2 beluga43)
		(next_load dummy-type slot2 dummy-slot beluga43)
		; 0: typeB
		(to_load typeB slot0 beluga44)
		(next_load dummy-type slot0 dummy-slot beluga44)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga45)
		(next_load typeB slot0 slot1 beluga45)
		(next_load dummy-type slot1 dummy-slot beluga45)
		; 0: typeC
		(to_load typeC slot0 beluga46)
		(next_load dummy-type slot0 dummy-slot beluga46)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga47)
		(next_load typeB slot0 slot1 beluga47)
		(next_load dummy-type slot1 dummy-slot beluga47)
		; 0: typeB
		(to_load typeB slot0 beluga48)
		(next_load dummy-type slot0 dummy-slot beluga48)
		; 0: typeB
		(to_load typeB slot0 beluga49)
		(next_load dummy-type slot0 dummy-slot beluga49)
		; 0: typeB
		(to_load typeB slot0 beluga50)
		(next_load dummy-type slot0 dummy-slot beluga50)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga51)
		(next_load typeA slot0 slot1 beluga51)
		(next_load dummy-type slot1 dummy-slot beluga51)
		; 0: typeC
		(to_load typeC slot0 beluga52)
		(next_load dummy-type slot0 dummy-slot beluga52)
		; 0: typeA
		(to_load typeA slot0 beluga53)
		(next_load dummy-type slot0 dummy-slot beluga53)
		; 0: typeB 1: typeB 2: typeB
		(to_load typeB slot0 beluga54)
		(next_load typeB slot0 slot1 beluga54)
		(next_load typeB slot1 slot2 beluga54)
		(next_load dummy-type slot2 dummy-slot beluga54)
		; 0: typeC 1: typeC
		(to_load typeC slot0 beluga55)
		(next_load typeC slot0 slot1 beluga55)
		(next_load dummy-type slot1 dummy-slot beluga55)
		; 0: typeA
		(to_load typeA slot0 beluga56)
		(next_load dummy-type slot0 dummy-slot beluga56)
		; 0: typeE
		(to_load typeE slot0 beluga57)
		(next_load dummy-type slot0 dummy-slot beluga57)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga58)
		(next_load typeD slot0 slot1 beluga58)
		(next_load dummy-type slot1 dummy-slot beluga58)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga59)
		(next_load typeA slot0 slot1 beluga59)
		(next_load dummy-type slot1 dummy-slot beluga59)
		; 0: typeC
		(to_load typeC slot0 beluga60)
		(next_load dummy-type slot0 dummy-slot beluga60)
		; 0: typeB
		(to_load typeB slot0 beluga61)
		(next_load dummy-type slot0 dummy-slot beluga61)
		; 0: typeA 1: typeA 2: typeA 3: typeA 4: typeA
		(to_load typeA slot0 beluga62)
		(next_load typeA slot0 slot1 beluga62)
		(next_load typeA slot1 slot2 beluga62)
		(next_load typeA slot2 slot3 beluga62)
		(next_load typeA slot3 slot4 beluga62)
		(next_load dummy-type slot4 dummy-slot beluga62)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga63)
		(next_load typeB slot0 slot1 beluga63)
		(next_load dummy-type slot1 dummy-slot beluga63)
		; 0: typeA 1: typeA 2: typeA 3: typeA
		(to_load typeA slot0 beluga64)
		(next_load typeA slot0 slot1 beluga64)
		(next_load typeA slot1 slot2 beluga64)
		(next_load typeA slot2 slot3 beluga64)
		(next_load dummy-type slot3 dummy-slot beluga64)
		; 0: typeB
		(to_load typeB slot0 beluga65)
		(next_load dummy-type slot0 dummy-slot beluga65)
		; 0: typeA
		(to_load typeA slot0 beluga66)
		(next_load dummy-type slot0 dummy-slot beluga66)
		; 0: typeC
		(to_load typeC slot0 beluga67)
		(next_load dummy-type slot0 dummy-slot beluga67)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga68)
		(next_load typeA slot0 slot1 beluga68)
		(next_load dummy-type slot1 dummy-slot beluga68)
		; 0: typeC
		(to_load typeC slot0 beluga69)
		(next_load dummy-type slot0 dummy-slot beluga69)
		; 0: typeC
		(to_load typeC slot0 beluga70)
		(next_load dummy-type slot0 dummy-slot beluga70)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga71)
		(next_load typeB slot0 slot1 beluga71)
		(next_load dummy-type slot1 dummy-slot beluga71)
		; 0: typeB
		(to_load typeB slot0 beluga72)
		(next_load dummy-type slot0 dummy-slot beluga72)
		; 0: typeA 1: typeA 2: typeA 3: typeA 4: typeA 5: typeA
		(to_load typeA slot0 beluga73)
		(next_load typeA slot0 slot1 beluga73)
		(next_load typeA slot1 slot2 beluga73)
		(next_load typeA slot2 slot3 beluga73)
		(next_load typeA slot3 slot4 beluga73)
		(next_load typeA slot4 slot5 beluga73)
		(next_load dummy-type slot5 dummy-slot beluga73)
		; 0: typeC
		(to_load typeC slot0 beluga74)
		(next_load dummy-type slot0 dummy-slot beluga74)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga75)
		(next_load typeA slot0 slot1 beluga75)
		(next_load dummy-type slot1 dummy-slot beluga75)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga76)
		(next_load typeB slot0 slot1 beluga76)
		(next_load dummy-type slot1 dummy-slot beluga76)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga77)
		(next_load typeA slot0 slot1 beluga77)
		(next_load dummy-type slot1 dummy-slot beluga77)
		; 0: typeC
		(to_load typeC slot0 beluga78)
		(next_load dummy-type slot0 dummy-slot beluga78)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga79)
		(next_load typeA slot0 slot1 beluga79)
		(next_load dummy-type slot1 dummy-slot beluga79)
		; 0: typeC 1: typeC
		(to_load typeC slot0 beluga80)
		(next_load typeC slot0 slot1 beluga80)
		(next_load dummy-type slot1 dummy-slot beluga80)
		; 0: typeA 1: typeA 2: typeA 3: typeA
		(to_load typeA slot0 beluga81)
		(next_load typeA slot0 slot1 beluga81)
		(next_load typeA slot1 slot2 beluga81)
		(next_load typeA slot2 slot3 beluga81)
		(next_load dummy-type slot3 dummy-slot beluga81)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga82)
		(next_load typeA slot0 slot1 beluga82)
		(next_load dummy-type slot1 dummy-slot beluga82)
		; 0: typeE
		(to_load typeE slot0 beluga83)
		(next_load dummy-type slot0 dummy-slot beluga83)
		; 0: typeA
		(to_load typeA slot0 beluga84)
		(next_load dummy-type slot0 dummy-slot beluga84)
		; 0: typeA
		(to_load typeA slot0 beluga85)
		(next_load dummy-type slot0 dummy-slot beluga85)
		; 0: typeE
		(to_load typeE slot0 beluga86)
		(next_load dummy-type slot0 dummy-slot beluga86)
		; 0: typeA
		(to_load typeA slot0 beluga87)
		(next_load dummy-type slot0 dummy-slot beluga87)
		; 0: typeE
		(to_load typeE slot0 beluga88)
		(next_load dummy-type slot0 dummy-slot beluga88)
		; 0: typeC
		(to_load typeC slot0 beluga89)
		(next_load dummy-type slot0 dummy-slot beluga89)
		; 0: typeA
		(to_load typeA slot0 beluga90)
		(next_load dummy-type slot0 dummy-slot beluga90)
		; 0: typeB
		(to_load typeB slot0 beluga91)
		(next_load dummy-type slot0 dummy-slot beluga91)
		; 0: typeB
		(to_load typeB slot0 beluga92)
		(next_load dummy-type slot0 dummy-slot beluga92)
		; 0: typeC
		(to_load typeC slot0 beluga93)
		(next_load dummy-type slot0 dummy-slot beluga93)
		; 0: typeA
		(to_load typeA slot0 beluga94)
		(next_load dummy-type slot0 dummy-slot beluga94)
		; 0: typeA
		(to_load typeA slot0 beluga95)
		(next_load dummy-type slot0 dummy-slot beluga95)
		; 0: typeC
		(to_load typeC slot0 beluga96)
		(next_load dummy-type slot0 dummy-slot beluga96)
		; 0: typeB
		(to_load typeB slot0 beluga97)
		(next_load dummy-type slot0 dummy-slot beluga97)
		; 0: typeC
		(to_load typeC slot0 beluga98)
		(next_load dummy-type slot0 dummy-slot beluga98)
		; 0: typeB
		(to_load typeB slot0 beluga99)
		(next_load dummy-type slot0 dummy-slot beluga99)
		; 0: typeB
		(to_load typeB slot0 beluga100)
		(next_load dummy-type slot0 dummy-slot beluga100)
		; 0: typeC
		(to_load typeC slot0 beluga101)
		(next_load dummy-type slot0 dummy-slot beluga101)
		; 0: typeB
		(to_load typeB slot0 beluga102)
		(next_load dummy-type slot0 dummy-slot beluga102)
		; 0: typeC
		(to_load typeC slot0 beluga103)
		(next_load dummy-type slot0 dummy-slot beluga103)
		; 0: typeE
		(to_load typeE slot0 beluga104)
		(next_load dummy-type slot0 dummy-slot beluga104)
		; 0: typeC
		(to_load typeC slot0 beluga105)
		(next_load dummy-type slot0 dummy-slot beluga105)
		; 0: typeA 1: typeA 2: typeA 3: typeA
		(to_load typeA slot0 beluga106)
		(next_load typeA slot0 slot1 beluga106)
		(next_load typeA slot1 slot2 beluga106)
		(next_load typeA slot2 slot3 beluga106)
		(next_load dummy-type slot3 dummy-slot beluga106)
		; 0: typeA
		(to_load typeA slot0 beluga107)
		(next_load dummy-type slot0 dummy-slot beluga107)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga108)
		(next_load typeB slot0 slot1 beluga108)
		(next_load dummy-type slot1 dummy-slot beluga108)
		; 0: typeA 1: typeA 2: typeA
		(to_load typeA slot0 beluga109)
		(next_load typeA slot0 slot1 beluga109)
		(next_load typeA slot1 slot2 beluga109)
		(next_load dummy-type slot2 dummy-slot beluga109)
		; 0: typeA
		(to_load typeA slot0 beluga110)
		(next_load dummy-type slot0 dummy-slot beluga110)
		; 0: typeE
		(to_load typeE slot0 beluga111)
		(next_load dummy-type slot0 dummy-slot beluga111)
		; 0: typeA
		(to_load typeA slot0 beluga112)
		(next_load dummy-type slot0 dummy-slot beluga112)
		; 0: typeB
		(to_load typeB slot0 beluga113)
		(next_load dummy-type slot0 dummy-slot beluga113)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga114)
		(next_load typeA slot0 slot1 beluga114)
		(next_load dummy-type slot1 dummy-slot beluga114)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga115)
		(next_load typeD slot0 slot1 beluga115)
		(next_load dummy-type slot1 dummy-slot beluga115)
		; 0: typeA
		(to_load typeA slot0 beluga116)
		(next_load dummy-type slot0 dummy-slot beluga116)
		; 0: typeA
		(to_load typeA slot0 beluga117)
		(next_load dummy-type slot0 dummy-slot beluga117)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga118)
		(next_load typeA slot0 slot1 beluga118)
		(next_load dummy-type slot1 dummy-slot beluga118)
		; 0: typeA
		(to_load typeA slot0 beluga119)
		(next_load dummy-type slot0 dummy-slot beluga119)
		; 0: typeA
		(to_load typeA slot0 beluga120)
		(next_load dummy-type slot0 dummy-slot beluga120)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga121)
		(next_load typeB slot0 slot1 beluga121)
		(next_load dummy-type slot1 dummy-slot beluga121)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga122)
		(next_load typeD slot0 slot1 beluga122)
		(next_load dummy-type slot1 dummy-slot beluga122)
		; 0: typeA 1: typeA
		(to_load typeA slot0 beluga123)
		(next_load typeA slot0 slot1 beluga123)
		(next_load dummy-type slot1 dummy-slot beluga123)
		; 0: typeE
		(to_load typeE slot0 beluga124)
		(next_load dummy-type slot0 dummy-slot beluga124)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga125)
		(next_load typeB slot0 slot1 beluga125)
		(next_load dummy-type slot1 dummy-slot beluga125)
		; 0: typeE
		(to_load typeE slot0 beluga126)
		(next_load dummy-type slot0 dummy-slot beluga126)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga127)
		(next_load typeD slot0 slot1 beluga127)
		(next_load dummy-type slot1 dummy-slot beluga127)
		; 0: typeE
		(to_load typeE slot0 beluga128)
		(next_load dummy-type slot0 dummy-slot beluga128)
		; 0: typeC
		(to_load typeC slot0 beluga129)
		(next_load dummy-type slot0 dummy-slot beluga129)
		; 0: typeB 1: typeB 2: typeB
		(to_load typeB slot0 beluga130)
		(next_load typeB slot0 slot1 beluga130)
		(next_load typeB slot1 slot2 beluga130)
		(next_load dummy-type slot2 dummy-slot beluga130)
		; 0: typeE
		(to_load typeE slot0 beluga131)
		(next_load dummy-type slot0 dummy-slot beluga131)
		; 0: typeC
		(to_load typeC slot0 beluga132)
		(next_load dummy-type slot0 dummy-slot beluga132)
		; 0: typeB
		(to_load typeB slot0 beluga133)
		(next_load dummy-type slot0 dummy-slot beluga133)
		; 0: typeC
		(to_load typeC slot0 beluga134)
		(next_load dummy-type slot0 dummy-slot beluga134)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga135)
		(next_load typeB slot0 slot1 beluga135)
		(next_load dummy-type slot1 dummy-slot beluga135)
		; 0: typeC
		(to_load typeC slot0 beluga136)
		(next_load dummy-type slot0 dummy-slot beluga136)
		; 0: typeA 1: typeA 2: typeA 3: typeA 4: typeA
		(to_load typeA slot0 beluga137)
		(next_load typeA slot0 slot1 beluga137)
		(next_load typeA slot1 slot2 beluga137)
		(next_load typeA slot2 slot3 beluga137)
		(next_load typeA slot3 slot4 beluga137)
		(next_load dummy-type slot4 dummy-slot beluga137)
		; 0: typeC 1: typeC
		(to_load typeC slot0 beluga138)
		(next_load typeC slot0 slot1 beluga138)
		(next_load dummy-type slot1 dummy-slot beluga138)
		; 0: typeA
		(to_load typeA slot0 beluga139)
		(next_load dummy-type slot0 dummy-slot beluga139)
		; 0: typeC 1: typeC
		(to_load typeC slot0 beluga140)
		(next_load typeC slot0 slot1 beluga140)
		(next_load dummy-type slot1 dummy-slot beluga140)
		; 0: typeB
		(to_load typeB slot0 beluga141)
		(next_load dummy-type slot0 dummy-slot beluga141)
		; 0: typeA 1: typeA 2: typeA
		(to_load typeA slot0 beluga142)
		(next_load typeA slot0 slot1 beluga142)
		(next_load typeA slot1 slot2 beluga142)
		(next_load dummy-type slot2 dummy-slot beluga142)
		; 0: typeC
		(to_load typeC slot0 beluga143)
		(next_load dummy-type slot0 dummy-slot beluga143)
		; 0: typeA
		(to_load typeA slot0 beluga144)
		(next_load dummy-type slot0 dummy-slot beluga144)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga145)
		(next_load typeB slot0 slot1 beluga145)
		(next_load dummy-type slot1 dummy-slot beluga145)
		; 0: typeA
		(to_load typeA slot0 beluga146)
		(next_load dummy-type slot0 dummy-slot beluga146)
		; 0: typeC
		(to_load typeC slot0 beluga147)
		(next_load dummy-type slot0 dummy-slot beluga147)
		; 0: typeA
		(to_load typeA slot0 beluga148)
		(next_load dummy-type slot0 dummy-slot beluga148)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga149)
		(next_load typeB slot0 slot1 beluga149)
		(next_load dummy-type slot1 dummy-slot beluga149)
		; 0: typeC 1: typeC
		(to_load typeC slot0 beluga150)
		(next_load typeC slot0 slot1 beluga150)
		(next_load dummy-type slot1 dummy-slot beluga150)
		; 0: typeA 1: typeA 2: typeA 3: typeA
		(to_load typeA slot0 beluga151)
		(next_load typeA slot0 slot1 beluga151)
		(next_load typeA slot1 slot2 beluga151)
		(next_load typeA slot2 slot3 beluga151)
		(next_load dummy-type slot3 dummy-slot beluga151)
		; 0: typeA
		(to_load typeA slot0 beluga152)
		(next_load dummy-type slot0 dummy-slot beluga152)
		; 0: typeE
		(to_load typeE slot0 beluga153)
		(next_load dummy-type slot0 dummy-slot beluga153)
		; 0: typeE
		(to_load typeE slot0 beluga154)
		(next_load dummy-type slot0 dummy-slot beluga154)
		; 0: typeA
		(to_load typeA slot0 beluga155)
		(next_load dummy-type slot0 dummy-slot beluga155)
		; 0: typeA
		(to_load typeA slot0 beluga156)
		(next_load dummy-type slot0 dummy-slot beluga156)
		; 0: typeA
		(to_load typeA slot0 beluga157)
		(next_load dummy-type slot0 dummy-slot beluga157)
		; 0: typeC
		(to_load typeC slot0 beluga158)
		(next_load dummy-type slot0 dummy-slot beluga158)
		; 0: typeC
		(to_load typeC slot0 beluga159)
		(next_load dummy-type slot0 dummy-slot beluga159)
		; 0: typeC 1: typeC
		(to_load typeC slot0 beluga160)
		(next_load typeC slot0 slot1 beluga160)
		(next_load dummy-type slot1 dummy-slot beluga160)
		; 0: typeE
		(to_load typeE slot0 beluga161)
		(next_load dummy-type slot0 dummy-slot beluga161)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga162)
		(next_load typeD slot0 slot1 beluga162)
		(next_load dummy-type slot1 dummy-slot beluga162)
		; 0: typeB
		(to_load typeB slot0 beluga163)
		(next_load dummy-type slot0 dummy-slot beluga163)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga164)
		(next_load typeD slot0 slot1 beluga164)
		(next_load dummy-type slot1 dummy-slot beluga164)
		; 0: typeD 1: typeD
		(to_load typeD slot0 beluga165)
		(next_load typeD slot0 slot1 beluga165)
		(next_load dummy-type slot1 dummy-slot beluga165)
		; 0: typeB
		(to_load typeB slot0 beluga166)
		(next_load dummy-type slot0 dummy-slot beluga166)
		; 0: typeE
		(to_load typeE slot0 beluga167)
		(next_load dummy-type slot0 dummy-slot beluga167)
		; 0: typeC 1: typeC
		(to_load typeC slot0 beluga168)
		(next_load typeC slot0 slot1 beluga168)
		(next_load dummy-type slot1 dummy-slot beluga168)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga169)
		(next_load typeB slot0 slot1 beluga169)
		(next_load dummy-type slot1 dummy-slot beluga169)
		; 0: typeB 1: typeB
		(to_load typeB slot0 beluga170)
		(next_load typeB slot0 slot1 beluga170)
		(next_load dummy-type slot1 dummy-slot beluga170)
		; 0: typeB
		(to_load typeB slot0 beluga171)
		(next_load dummy-type slot0 dummy-slot beluga171)
		; 0: typeE
		(to_load typeE slot0 beluga172)
		(next_load dummy-type slot0 dummy-slot beluga172)
		; 0: typeE
		(to_load typeE slot0 beluga173)
		(next_load dummy-type slot0 dummy-slot beluga173)
		; Production schedule:
		; Production line: pl0
		; 0: jig0005 1: jig0011 2: jig0012 3: jig0013 4: jig0014 5: jig0008 6: jig0009 7: jig0018 8: jig0025 9: jig0019 10: jig0023 11: jig0026 12: jig0020 13: jig0024 14: jig0001 15: jig0017 16: jig0032 17: jig0002 18: jig0015 19: jig0027 20: jig0037 21: jig0021 22: jig0010 23: jig0022 24: jig0040 25: jig0028 26: jig0029 27: jig0031 28: jig0042 29: jig0016 30: jig0033 31: jig0045 32: jig0050 33: jig0057 34: jig0030 35: jig0036 36: jig0053 37: jig0035 38: jig0043 39: jig0048 40: jig0058 41: jig0039 42: jig0055 43: jig0034 44: jig0061 45: jig0041 46: jig0051 47: jig0056 48: jig0065 49: jig0046 50: jig0038 51: jig0049 52: jig0063 53: jig0052 54: jig0064 55: jig0044 56: jig0080 57: jig0071 58: jig0082 59: jig0067 60: jig0077 61: jig0083 62: jig0062 63: jig0079 64: jig0084 65: jig0047 66: jig0076 67: jig0054 68: jig0059 69: jig0060 70: jig0073 71: jig0075 72: jig0078 73: jig0066 74: jig0095 75: jig0099 76: jig0104 77: jig0070 78: jig0090 79: jig0092 80: jig0094 81: jig0101 82: jig0072 83: jig0097 84: jig0068 85: jig0096 86: jig0102 87: jig0107 88: jig0081 89: jig0085 90: jig0100 91: jig0069 92: jig0074 93: jig0088 94: jig0086 95: jig0091 96: jig0109 97: jig0089 98: jig0103 99: jig0105 100: jig0111 101: jig0087 102: jig0098 103: jig0114 104: jig0117 105: jig0120 106: jig0126 107: jig0130 108: jig0112 109: jig0115 110: jig0124 111: jig0106 112: jig0129 113: jig0133 114: jig0113 115: jig0118 116: jig0128 117: jig0136 118: jig0137 119: jig0119 120: jig0123 121: jig0093 122: jig0116 123: jig0132 124: jig0134 125: jig0127 126: jig0121 127: jig0108 128: jig0125 129: jig0143 130: jig0110 131: jig0144 132: jig0122 133: jig0140 134: jig0135 135: jig0145 136: jig0131 137: jig0150 138: jig0151 139: jig0146 140: jig0147 141: jig0148 142: jig0138 143: jig0141 144: jig0152 145: jig0166 146: jig0142 147: jig0155 148: jig0159 149: jig0161 150: jig0168 151: jig0172 152: jig0139 153: jig0173 154: jig0149 155: jig0176 156: jig0162 157: jig0163 158: jig0174 159: jig0170 160: jig0154 161: jig0167 162: jig0169 163: jig0160 164: jig0165 165: jig0157 166: jig0158 167: jig0181 168: jig0156 169: jig0171 170: jig0153 171: jig0177 172: jig0182 173: jig0164 174: jig0175 175: jig0187 176: jig0190 177: jig0188 178: jig0180 179: jig0184 180: jig0185 181: jig0178 182: jig0189 183: jig0201 184: jig0193 185: jig0197 186: jig0183 187: jig0186 188: jig0212 189: jig0179 190: jig0209 191: jig0210 192: jig0218 193: jig0219 194: jig0199 195: jig0202 196: jig0192 197: jig0213 198: jig0226 199: jig0203 200: jig0211 201: jig0220 202: jig0225 203: jig0191 204: jig0198 205: jig0223 206: jig0194 207: jig0195 208: jig0206 209: jig0233 210: jig0214 211: jig0196 212: jig0204 213: jig0224 214: jig0227 215: jig0208 216: jig0230 217: jig0231 218: jig0235 219: jig0234 220: jig0205 221: jig0207 222: jig0217 223: jig0215 224: jig0200 225: jig0222 226: jig0216 227: jig0221 228: jig0228 229: jig0245 230: jig0243 231: jig0244 232: jig0229 233: jig0232 234: jig0241 235: jig0237 236: jig0251 237: jig0236 238: jig0252 239: jig0242 240: jig0247 241: jig0254 242: jig0255 243: jig0240 244: jig0239 245: jig0246 246: jig0238 247: jig0256
		(to_deliver jig0005 pl0)
		(next_deliver jig0005 jig0011)
		(next_deliver jig0011 jig0012)
		(next_deliver jig0012 jig0013)
		(next_deliver jig0013 jig0014)
		(next_deliver jig0014 jig0008)
		(next_deliver jig0008 jig0009)
		(next_deliver jig0009 jig0018)
		(next_deliver jig0018 jig0025)
		(next_deliver jig0025 jig0019)
		(next_deliver jig0019 jig0023)
		(next_deliver jig0023 jig0026)
		(next_deliver jig0026 jig0020)
		(next_deliver jig0020 jig0024)
		(next_deliver jig0024 jig0001)
		(next_deliver jig0001 jig0017)
		(next_deliver jig0017 jig0032)
		(next_deliver jig0032 jig0002)
		(next_deliver jig0002 jig0015)
		(next_deliver jig0015 jig0027)
		(next_deliver jig0027 jig0037)
		(next_deliver jig0037 jig0021)
		(next_deliver jig0021 jig0010)
		(next_deliver jig0010 jig0022)
		(next_deliver jig0022 jig0040)
		(next_deliver jig0040 jig0028)
		(next_deliver jig0028 jig0029)
		(next_deliver jig0029 jig0031)
		(next_deliver jig0031 jig0042)
		(next_deliver jig0042 jig0016)
		(next_deliver jig0016 jig0033)
		(next_deliver jig0033 jig0045)
		(next_deliver jig0045 jig0050)
		(next_deliver jig0050 jig0057)
		(next_deliver jig0057 jig0030)
		(next_deliver jig0030 jig0036)
		(next_deliver jig0036 jig0053)
		(next_deliver jig0053 jig0035)
		(next_deliver jig0035 jig0043)
		(next_deliver jig0043 jig0048)
		(next_deliver jig0048 jig0058)
		(next_deliver jig0058 jig0039)
		(next_deliver jig0039 jig0055)
		(next_deliver jig0055 jig0034)
		(next_deliver jig0034 jig0061)
		(next_deliver jig0061 jig0041)
		(next_deliver jig0041 jig0051)
		(next_deliver jig0051 jig0056)
		(next_deliver jig0056 jig0065)
		(next_deliver jig0065 jig0046)
		(next_deliver jig0046 jig0038)
		(next_deliver jig0038 jig0049)
		(next_deliver jig0049 jig0063)
		(next_deliver jig0063 jig0052)
		(next_deliver jig0052 jig0064)
		(next_deliver jig0064 jig0044)
		(next_deliver jig0044 jig0080)
		(next_deliver jig0080 jig0071)
		(next_deliver jig0071 jig0082)
		(next_deliver jig0082 jig0067)
		(next_deliver jig0067 jig0077)
		(next_deliver jig0077 jig0083)
		(next_deliver jig0083 jig0062)
		(next_deliver jig0062 jig0079)
		(next_deliver jig0079 jig0084)
		(next_deliver jig0084 jig0047)
		(next_deliver jig0047 jig0076)
		(next_deliver jig0076 jig0054)
		(next_deliver jig0054 jig0059)
		(next_deliver jig0059 jig0060)
		(next_deliver jig0060 jig0073)
		(next_deliver jig0073 jig0075)
		(next_deliver jig0075 jig0078)
		(next_deliver jig0078 jig0066)
		(next_deliver jig0066 jig0095)
		(next_deliver jig0095 jig0099)
		(next_deliver jig0099 jig0104)
		(next_deliver jig0104 jig0070)
		(next_deliver jig0070 jig0090)
		(next_deliver jig0090 jig0092)
		(next_deliver jig0092 jig0094)
		(next_deliver jig0094 jig0101)
		(next_deliver jig0101 jig0072)
		(next_deliver jig0072 jig0097)
		(next_deliver jig0097 jig0068)
		(next_deliver jig0068 jig0096)
		(next_deliver jig0096 jig0102)
		(next_deliver jig0102 jig0107)
		(next_deliver jig0107 jig0081)
		(next_deliver jig0081 jig0085)
		(next_deliver jig0085 jig0100)
		(next_deliver jig0100 jig0069)
		(next_deliver jig0069 jig0074)
		(next_deliver jig0074 jig0088)
		(next_deliver jig0088 jig0086)
		(next_deliver jig0086 jig0091)
		(next_deliver jig0091 jig0109)
		(next_deliver jig0109 jig0089)
		(next_deliver jig0089 jig0103)
		(next_deliver jig0103 jig0105)
		(next_deliver jig0105 jig0111)
		(next_deliver jig0111 jig0087)
		(next_deliver jig0087 jig0098)
		(next_deliver jig0098 jig0114)
		(next_deliver jig0114 jig0117)
		(next_deliver jig0117 jig0120)
		(next_deliver jig0120 jig0126)
		(next_deliver jig0126 jig0130)
		(next_deliver jig0130 jig0112)
		(next_deliver jig0112 jig0115)
		(next_deliver jig0115 jig0124)
		(next_deliver jig0124 jig0106)
		(next_deliver jig0106 jig0129)
		(next_deliver jig0129 jig0133)
		(next_deliver jig0133 jig0113)
		(next_deliver jig0113 jig0118)
		(next_deliver jig0118 jig0128)
		(next_deliver jig0128 jig0136)
		(next_deliver jig0136 jig0137)
		(next_deliver jig0137 jig0119)
		(next_deliver jig0119 jig0123)
		(next_deliver jig0123 jig0093)
		(next_deliver jig0093 jig0116)
		(next_deliver jig0116 jig0132)
		(next_deliver jig0132 jig0134)
		(next_deliver jig0134 jig0127)
		(next_deliver jig0127 jig0121)
		(next_deliver jig0121 jig0108)
		(next_deliver jig0108 jig0125)
		(next_deliver jig0125 jig0143)
		(next_deliver jig0143 jig0110)
		(next_deliver jig0110 jig0144)
		(next_deliver jig0144 jig0122)
		(next_deliver jig0122 jig0140)
		(next_deliver jig0140 jig0135)
		(next_deliver jig0135 jig0145)
		(next_deliver jig0145 jig0131)
		(next_deliver jig0131 jig0150)
		(next_deliver jig0150 jig0151)
		(next_deliver jig0151 jig0146)
		(next_deliver jig0146 jig0147)
		(next_deliver jig0147 jig0148)
		(next_deliver jig0148 jig0138)
		(next_deliver jig0138 jig0141)
		(next_deliver jig0141 jig0152)
		(next_deliver jig0152 jig0166)
		(next_deliver jig0166 jig0142)
		(next_deliver jig0142 jig0155)
		(next_deliver jig0155 jig0159)
		(next_deliver jig0159 jig0161)
		(next_deliver jig0161 jig0168)
		(next_deliver jig0168 jig0172)
		(next_deliver jig0172 jig0139)
		(next_deliver jig0139 jig0173)
		(next_deliver jig0173 jig0149)
		(next_deliver jig0149 jig0176)
		(next_deliver jig0176 jig0162)
		(next_deliver jig0162 jig0163)
		(next_deliver jig0163 jig0174)
		(next_deliver jig0174 jig0170)
		(next_deliver jig0170 jig0154)
		(next_deliver jig0154 jig0167)
		(next_deliver jig0167 jig0169)
		(next_deliver jig0169 jig0160)
		(next_deliver jig0160 jig0165)
		(next_deliver jig0165 jig0157)
		(next_deliver jig0157 jig0158)
		(next_deliver jig0158 jig0181)
		(next_deliver jig0181 jig0156)
		(next_deliver jig0156 jig0171)
		(next_deliver jig0171 jig0153)
		(next_deliver jig0153 jig0177)
		(next_deliver jig0177 jig0182)
		(next_deliver jig0182 jig0164)
		(next_deliver jig0164 jig0175)
		(next_deliver jig0175 jig0187)
		(next_deliver jig0187 jig0190)
		(next_deliver jig0190 jig0188)
		(next_deliver jig0188 jig0180)
		(next_deliver jig0180 jig0184)
		(next_deliver jig0184 jig0185)
		(next_deliver jig0185 jig0178)
		(next_deliver jig0178 jig0189)
		(next_deliver jig0189 jig0201)
		(next_deliver jig0201 jig0193)
		(next_deliver jig0193 jig0197)
		(next_deliver jig0197 jig0183)
		(next_deliver jig0183 jig0186)
		(next_deliver jig0186 jig0212)
		(next_deliver jig0212 jig0179)
		(next_deliver jig0179 jig0209)
		(next_deliver jig0209 jig0210)
		(next_deliver jig0210 jig0218)
		(next_deliver jig0218 jig0219)
		(next_deliver jig0219 jig0199)
		(next_deliver jig0199 jig0202)
		(next_deliver jig0202 jig0192)
		(next_deliver jig0192 jig0213)
		(next_deliver jig0213 jig0226)
		(next_deliver jig0226 jig0203)
		(next_deliver jig0203 jig0211)
		(next_deliver jig0211 jig0220)
		(next_deliver jig0220 jig0225)
		(next_deliver jig0225 jig0191)
		(next_deliver jig0191 jig0198)
		(next_deliver jig0198 jig0223)
		(next_deliver jig0223 jig0194)
		(next_deliver jig0194 jig0195)
		(next_deliver jig0195 jig0206)
		(next_deliver jig0206 jig0233)
		(next_deliver jig0233 jig0214)
		(next_deliver jig0214 jig0196)
		(next_deliver jig0196 jig0204)
		(next_deliver jig0204 jig0224)
		(next_deliver jig0224 jig0227)
		(next_deliver jig0227 jig0208)
		(next_deliver jig0208 jig0230)
		(next_deliver jig0230 jig0231)
		(next_deliver jig0231 jig0235)
		(next_deliver jig0235 jig0234)
		(next_deliver jig0234 jig0205)
		(next_deliver jig0205 jig0207)
		(next_deliver jig0207 jig0217)
		(next_deliver jig0217 jig0215)
		(next_deliver jig0215 jig0200)
		(next_deliver jig0200 jig0222)
		(next_deliver jig0222 jig0216)
		(next_deliver jig0216 jig0221)
		(next_deliver jig0221 jig0228)
		(next_deliver jig0228 jig0245)
		(next_deliver jig0245 jig0243)
		(next_deliver jig0243 jig0244)
		(next_deliver jig0244 jig0229)
		(next_deliver jig0229 jig0232)
		(next_deliver jig0232 jig0241)
		(next_deliver jig0241 jig0237)
		(next_deliver jig0237 jig0251)
		(next_deliver jig0251 jig0236)
		(next_deliver jig0236 jig0252)
		(next_deliver jig0252 jig0242)
		(next_deliver jig0242 jig0247)
		(next_deliver jig0247 jig0254)
		(next_deliver jig0254 jig0255)
		(next_deliver jig0255 jig0240)
		(next_deliver jig0240 jig0239)
		(next_deliver jig0239 jig0246)
		(next_deliver jig0246 jig0238)
		(next_deliver jig0238 jig0256)
		(next_deliver jig0256 dummy-jig)
		; Action cost:
		(= (total-cost ) 0)
	)
  (:goal (and
		; All jigs empty (order defined by production schedule)
		(empty jig0005)
		(empty jig0011)
		(empty jig0012)
		(empty jig0013)
		(empty jig0014)
		(empty jig0008)
		(empty jig0009)
		(empty jig0018)
		(empty jig0025)
		(empty jig0019)
		(empty jig0023)
		(empty jig0026)
		(empty jig0020)
		(empty jig0024)
		(empty jig0001)
		(empty jig0017)
		(empty jig0032)
		(empty jig0002)
		(empty jig0015)
		(empty jig0027)
		(empty jig0037)
		(empty jig0021)
		(empty jig0010)
		(empty jig0022)
		(empty jig0040)
		(empty jig0028)
		(empty jig0029)
		(empty jig0031)
		(empty jig0042)
		(empty jig0016)
		(empty jig0033)
		(empty jig0045)
		(empty jig0050)
		(empty jig0057)
		(empty jig0030)
		(empty jig0036)
		(empty jig0053)
		(empty jig0035)
		(empty jig0043)
		(empty jig0048)
		(empty jig0058)
		(empty jig0039)
		(empty jig0055)
		(empty jig0034)
		(empty jig0061)
		(empty jig0041)
		(empty jig0051)
		(empty jig0056)
		(empty jig0065)
		(empty jig0046)
		(empty jig0038)
		(empty jig0049)
		(empty jig0063)
		(empty jig0052)
		(empty jig0064)
		(empty jig0044)
		(empty jig0080)
		(empty jig0071)
		(empty jig0082)
		(empty jig0067)
		(empty jig0077)
		(empty jig0083)
		(empty jig0062)
		(empty jig0079)
		(empty jig0084)
		(empty jig0047)
		(empty jig0076)
		(empty jig0054)
		(empty jig0059)
		(empty jig0060)
		(empty jig0073)
		(empty jig0075)
		(empty jig0078)
		(empty jig0066)
		(empty jig0095)
		(empty jig0099)
		(empty jig0104)
		(empty jig0070)
		(empty jig0090)
		(empty jig0092)
		(empty jig0094)
		(empty jig0101)
		(empty jig0072)
		(empty jig0097)
		(empty jig0068)
		(empty jig0096)
		(empty jig0102)
		(empty jig0107)
		(empty jig0081)
		(empty jig0085)
		(empty jig0100)
		(empty jig0069)
		(empty jig0074)
		(empty jig0088)
		(empty jig0086)
		(empty jig0091)
		(empty jig0109)
		(empty jig0089)
		(empty jig0103)
		(empty jig0105)
		(empty jig0111)
		(empty jig0087)
		(empty jig0098)
		(empty jig0114)
		(empty jig0117)
		(empty jig0120)
		(empty jig0126)
		(empty jig0130)
		(empty jig0112)
		(empty jig0115)
		(empty jig0124)
		(empty jig0106)
		(empty jig0129)
		(empty jig0133)
		(empty jig0113)
		(empty jig0118)
		(empty jig0128)
		(empty jig0136)
		(empty jig0137)
		(empty jig0119)
		(empty jig0123)
		(empty jig0093)
		(empty jig0116)
		(empty jig0132)
		(empty jig0134)
		(empty jig0127)
		(empty jig0121)
		(empty jig0108)
		(empty jig0125)
		(empty jig0143)
		(empty jig0110)
		(empty jig0144)
		(empty jig0122)
		(empty jig0140)
		(empty jig0135)
		(empty jig0145)
		(empty jig0131)
		(empty jig0150)
		(empty jig0151)
		(empty jig0146)
		(empty jig0147)
		(empty jig0148)
		(empty jig0138)
		(empty jig0141)
		(empty jig0152)
		(empty jig0166)
		(empty jig0142)
		(empty jig0155)
		(empty jig0159)
		(empty jig0161)
		(empty jig0168)
		(empty jig0172)
		(empty jig0139)
		(empty jig0173)
		(empty jig0149)
		(empty jig0176)
		(empty jig0162)
		(empty jig0163)
		(empty jig0174)
		(empty jig0170)
		(empty jig0154)
		(empty jig0167)
		(empty jig0169)
		(empty jig0160)
		(empty jig0165)
		(empty jig0157)
		(empty jig0158)
		(empty jig0181)
		(empty jig0156)
		(empty jig0171)
		(empty jig0153)
		(empty jig0177)
		(empty jig0182)
		(empty jig0164)
		(empty jig0175)
		(empty jig0187)
		(empty jig0190)
		(empty jig0188)
		(empty jig0180)
		(empty jig0184)
		(empty jig0185)
		(empty jig0178)
		(empty jig0189)
		(empty jig0201)
		(empty jig0193)
		(empty jig0197)
		(empty jig0183)
		(empty jig0186)
		(empty jig0212)
		(empty jig0179)
		(empty jig0209)
		(empty jig0210)
		(empty jig0218)
		(empty jig0219)
		(empty jig0199)
		(empty jig0202)
		(empty jig0192)
		(empty jig0213)
		(empty jig0226)
		(empty jig0203)
		(empty jig0211)
		(empty jig0220)
		(empty jig0225)
		(empty jig0191)
		(empty jig0198)
		(empty jig0223)
		(empty jig0194)
		(empty jig0195)
		(empty jig0206)
		(empty jig0233)
		(empty jig0214)
		(empty jig0196)
		(empty jig0204)
		(empty jig0224)
		(empty jig0227)
		(empty jig0208)
		(empty jig0230)
		(empty jig0231)
		(empty jig0235)
		(empty jig0234)
		(empty jig0205)
		(empty jig0207)
		(empty jig0217)
		(empty jig0215)
		(empty jig0200)
		(empty jig0222)
		(empty jig0216)
		(empty jig0221)
		(empty jig0228)
		(empty jig0245)
		(empty jig0243)
		(empty jig0244)
		(empty jig0229)
		(empty jig0232)
		(empty jig0241)
		(empty jig0237)
		(empty jig0251)
		(empty jig0236)
		(empty jig0252)
		(empty jig0242)
		(empty jig0247)
		(empty jig0254)
		(empty jig0255)
		(empty jig0240)
		(empty jig0239)
		(empty jig0246)
		(empty jig0238)
		(empty jig0256)
		; all Belugas fully unloaded:
		(to_unload dummy-jig beluga1)
		(to_unload dummy-jig beluga2)
		(to_unload dummy-jig beluga3)
		(to_unload dummy-jig beluga4)
		(to_unload dummy-jig beluga5)
		(to_unload dummy-jig beluga6)
		(to_unload dummy-jig beluga7)
		(to_unload dummy-jig beluga8)
		(to_unload dummy-jig beluga9)
		(to_unload dummy-jig beluga10)
		(to_unload dummy-jig beluga11)
		(to_unload dummy-jig beluga12)
		(to_unload dummy-jig beluga13)
		(to_unload dummy-jig beluga14)
		(to_unload dummy-jig beluga15)
		(to_unload dummy-jig beluga16)
		(to_unload dummy-jig beluga17)
		(to_unload dummy-jig beluga18)
		(to_unload dummy-jig beluga19)
		(to_unload dummy-jig beluga20)
		(to_unload dummy-jig beluga21)
		(to_unload dummy-jig beluga22)
		(to_unload dummy-jig beluga23)
		(to_unload dummy-jig beluga24)
		(to_unload dummy-jig beluga25)
		(to_unload dummy-jig beluga26)
		(to_unload dummy-jig beluga27)
		(to_unload dummy-jig beluga28)
		(to_unload dummy-jig beluga29)
		(to_unload dummy-jig beluga30)
		(to_unload dummy-jig beluga31)
		(to_unload dummy-jig beluga32)
		(to_unload dummy-jig beluga33)
		(to_unload dummy-jig beluga34)
		(to_unload dummy-jig beluga35)
		(to_unload dummy-jig beluga36)
		(to_unload dummy-jig beluga37)
		(to_unload dummy-jig beluga38)
		(to_unload dummy-jig beluga39)
		(to_unload dummy-jig beluga40)
		(to_unload dummy-jig beluga41)
		(to_unload dummy-jig beluga42)
		(to_unload dummy-jig beluga43)
		(to_unload dummy-jig beluga44)
		(to_unload dummy-jig beluga45)
		(to_unload dummy-jig beluga46)
		(to_unload dummy-jig beluga47)
		(to_unload dummy-jig beluga48)
		(to_unload dummy-jig beluga49)
		(to_unload dummy-jig beluga50)
		(to_unload dummy-jig beluga51)
		(to_unload dummy-jig beluga52)
		(to_unload dummy-jig beluga53)
		(to_unload dummy-jig beluga54)
		(to_unload dummy-jig beluga55)
		(to_unload dummy-jig beluga56)
		(to_unload dummy-jig beluga57)
		(to_unload dummy-jig beluga58)
		(to_unload dummy-jig beluga59)
		(to_unload dummy-jig beluga60)
		(to_unload dummy-jig beluga61)
		(to_unload dummy-jig beluga62)
		(to_unload dummy-jig beluga63)
		(to_unload dummy-jig beluga64)
		(to_unload dummy-jig beluga65)
		(to_unload dummy-jig beluga66)
		(to_unload dummy-jig beluga67)
		(to_unload dummy-jig beluga68)
		(to_unload dummy-jig beluga69)
		(to_unload dummy-jig beluga70)
		(to_unload dummy-jig beluga71)
		(to_unload dummy-jig beluga72)
		(to_unload dummy-jig beluga73)
		(to_unload dummy-jig beluga74)
		(to_unload dummy-jig beluga75)
		(to_unload dummy-jig beluga76)
		(to_unload dummy-jig beluga77)
		(to_unload dummy-jig beluga78)
		(to_unload dummy-jig beluga79)
		(to_unload dummy-jig beluga80)
		(to_unload dummy-jig beluga81)
		(to_unload dummy-jig beluga82)
		(to_unload dummy-jig beluga83)
		(to_unload dummy-jig beluga84)
		(to_unload dummy-jig beluga85)
		(to_unload dummy-jig beluga86)
		(to_unload dummy-jig beluga87)
		(to_unload dummy-jig beluga88)
		(to_unload dummy-jig beluga89)
		(to_unload dummy-jig beluga90)
		(to_unload dummy-jig beluga91)
		(to_unload dummy-jig beluga92)
		(to_unload dummy-jig beluga93)
		(to_unload dummy-jig beluga94)
		(to_unload dummy-jig beluga95)
		(to_unload dummy-jig beluga96)
		(to_unload dummy-jig beluga97)
		(to_unload dummy-jig beluga98)
		(to_unload dummy-jig beluga99)
		(to_unload dummy-jig beluga100)
		(to_unload dummy-jig beluga101)
		(to_unload dummy-jig beluga102)
		(to_unload dummy-jig beluga103)
		(to_unload dummy-jig beluga104)
		(to_unload dummy-jig beluga105)
		(to_unload dummy-jig beluga106)
		(to_unload dummy-jig beluga107)
		(to_unload dummy-jig beluga108)
		(to_unload dummy-jig beluga109)
		(to_unload dummy-jig beluga110)
		(to_unload dummy-jig beluga111)
		(to_unload dummy-jig beluga112)
		(to_unload dummy-jig beluga113)
		(to_unload dummy-jig beluga114)
		(to_unload dummy-jig beluga115)
		(to_unload dummy-jig beluga116)
		(to_unload dummy-jig beluga117)
		(to_unload dummy-jig beluga118)
		(to_unload dummy-jig beluga119)
		(to_unload dummy-jig beluga120)
		(to_unload dummy-jig beluga121)
		(to_unload dummy-jig beluga122)
		(to_unload dummy-jig beluga123)
		(to_unload dummy-jig beluga124)
		(to_unload dummy-jig beluga125)
		(to_unload dummy-jig beluga126)
		(to_unload dummy-jig beluga127)
		(to_unload dummy-jig beluga128)
		(to_unload dummy-jig beluga129)
		(to_unload dummy-jig beluga130)
		(to_unload dummy-jig beluga131)
		(to_unload dummy-jig beluga132)
		(to_unload dummy-jig beluga133)
		(to_unload dummy-jig beluga134)
		(to_unload dummy-jig beluga135)
		(to_unload dummy-jig beluga136)
		(to_unload dummy-jig beluga137)
		(to_unload dummy-jig beluga138)
		(to_unload dummy-jig beluga139)
		(to_unload dummy-jig beluga140)
		(to_unload dummy-jig beluga141)
		(to_unload dummy-jig beluga142)
		(to_unload dummy-jig beluga143)
		(to_unload dummy-jig beluga144)
		(to_unload dummy-jig beluga145)
		(to_unload dummy-jig beluga146)
		(to_unload dummy-jig beluga147)
		(to_unload dummy-jig beluga148)
		(to_unload dummy-jig beluga149)
		(to_unload dummy-jig beluga150)
		(to_unload dummy-jig beluga151)
		(to_unload dummy-jig beluga152)
		(to_unload dummy-jig beluga153)
		(to_unload dummy-jig beluga154)
		(to_unload dummy-jig beluga155)
		(to_unload dummy-jig beluga156)
		(to_unload dummy-jig beluga157)
		(to_unload dummy-jig beluga158)
		(to_unload dummy-jig beluga159)
		(to_unload dummy-jig beluga160)
		(to_unload dummy-jig beluga161)
		(to_unload dummy-jig beluga162)
		(to_unload dummy-jig beluga163)
		(to_unload dummy-jig beluga164)
		(to_unload dummy-jig beluga165)
		(to_unload dummy-jig beluga166)
		(to_unload dummy-jig beluga167)
		(to_unload dummy-jig beluga168)
		(to_unload dummy-jig beluga169)
		(to_unload dummy-jig beluga170)
		(to_unload dummy-jig beluga171)
		(to_unload dummy-jig beluga172)
		(to_unload dummy-jig beluga173)
		; all Belugas fully loaded:
		(to_load dummy-type dummy-slot beluga1)
		(to_load dummy-type dummy-slot beluga2)
		(to_load dummy-type dummy-slot beluga3)
		(to_load dummy-type dummy-slot beluga4)
		(to_load dummy-type dummy-slot beluga5)
		(to_load dummy-type dummy-slot beluga6)
		(to_load dummy-type dummy-slot beluga7)
		(to_load dummy-type dummy-slot beluga8)
		(to_load dummy-type dummy-slot beluga9)
		(to_load dummy-type dummy-slot beluga10)
		(to_load dummy-type dummy-slot beluga11)
		(to_load dummy-type dummy-slot beluga12)
		(to_load dummy-type dummy-slot beluga13)
		(to_load dummy-type dummy-slot beluga14)
		(to_load dummy-type dummy-slot beluga15)
		(to_load dummy-type dummy-slot beluga16)
		(to_load dummy-type dummy-slot beluga17)
		(to_load dummy-type dummy-slot beluga18)
		(to_load dummy-type dummy-slot beluga19)
		(to_load dummy-type dummy-slot beluga20)
		(to_load dummy-type dummy-slot beluga21)
		(to_load dummy-type dummy-slot beluga22)
		(to_load dummy-type dummy-slot beluga23)
		(to_load dummy-type dummy-slot beluga24)
		(to_load dummy-type dummy-slot beluga25)
		(to_load dummy-type dummy-slot beluga26)
		(to_load dummy-type dummy-slot beluga27)
		(to_load dummy-type dummy-slot beluga28)
		(to_load dummy-type dummy-slot beluga29)
		(to_load dummy-type dummy-slot beluga30)
		(to_load dummy-type dummy-slot beluga31)
		(to_load dummy-type dummy-slot beluga32)
		(to_load dummy-type dummy-slot beluga33)
		(to_load dummy-type dummy-slot beluga34)
		(to_load dummy-type dummy-slot beluga35)
		(to_load dummy-type dummy-slot beluga36)
		(to_load dummy-type dummy-slot beluga37)
		(to_load dummy-type dummy-slot beluga38)
		(to_load dummy-type dummy-slot beluga39)
		(to_load dummy-type dummy-slot beluga40)
		(to_load dummy-type dummy-slot beluga41)
		(to_load dummy-type dummy-slot beluga42)
		(to_load dummy-type dummy-slot beluga43)
		(to_load dummy-type dummy-slot beluga44)
		(to_load dummy-type dummy-slot beluga45)
		(to_load dummy-type dummy-slot beluga46)
		(to_load dummy-type dummy-slot beluga47)
		(to_load dummy-type dummy-slot beluga48)
		(to_load dummy-type dummy-slot beluga49)
		(to_load dummy-type dummy-slot beluga50)
		(to_load dummy-type dummy-slot beluga51)
		(to_load dummy-type dummy-slot beluga52)
		(to_load dummy-type dummy-slot beluga53)
		(to_load dummy-type dummy-slot beluga54)
		(to_load dummy-type dummy-slot beluga55)
		(to_load dummy-type dummy-slot beluga56)
		(to_load dummy-type dummy-slot beluga57)
		(to_load dummy-type dummy-slot beluga58)
		(to_load dummy-type dummy-slot beluga59)
		(to_load dummy-type dummy-slot beluga60)
		(to_load dummy-type dummy-slot beluga61)
		(to_load dummy-type dummy-slot beluga62)
		(to_load dummy-type dummy-slot beluga63)
		(to_load dummy-type dummy-slot beluga64)
		(to_load dummy-type dummy-slot beluga65)
		(to_load dummy-type dummy-slot beluga66)
		(to_load dummy-type dummy-slot beluga67)
		(to_load dummy-type dummy-slot beluga68)
		(to_load dummy-type dummy-slot beluga69)
		(to_load dummy-type dummy-slot beluga70)
		(to_load dummy-type dummy-slot beluga71)
		(to_load dummy-type dummy-slot beluga72)
		(to_load dummy-type dummy-slot beluga73)
		(to_load dummy-type dummy-slot beluga74)
		(to_load dummy-type dummy-slot beluga75)
		(to_load dummy-type dummy-slot beluga76)
		(to_load dummy-type dummy-slot beluga77)
		(to_load dummy-type dummy-slot beluga78)
		(to_load dummy-type dummy-slot beluga79)
		(to_load dummy-type dummy-slot beluga80)
		(to_load dummy-type dummy-slot beluga81)
		(to_load dummy-type dummy-slot beluga82)
		(to_load dummy-type dummy-slot beluga83)
		(to_load dummy-type dummy-slot beluga84)
		(to_load dummy-type dummy-slot beluga85)
		(to_load dummy-type dummy-slot beluga86)
		(to_load dummy-type dummy-slot beluga87)
		(to_load dummy-type dummy-slot beluga88)
		(to_load dummy-type dummy-slot beluga89)
		(to_load dummy-type dummy-slot beluga90)
		(to_load dummy-type dummy-slot beluga91)
		(to_load dummy-type dummy-slot beluga92)
		(to_load dummy-type dummy-slot beluga93)
		(to_load dummy-type dummy-slot beluga94)
		(to_load dummy-type dummy-slot beluga95)
		(to_load dummy-type dummy-slot beluga96)
		(to_load dummy-type dummy-slot beluga97)
		(to_load dummy-type dummy-slot beluga98)
		(to_load dummy-type dummy-slot beluga99)
		(to_load dummy-type dummy-slot beluga100)
		(to_load dummy-type dummy-slot beluga101)
		(to_load dummy-type dummy-slot beluga102)
		(to_load dummy-type dummy-slot beluga103)
		(to_load dummy-type dummy-slot beluga104)
		(to_load dummy-type dummy-slot beluga105)
		(to_load dummy-type dummy-slot beluga106)
		(to_load dummy-type dummy-slot beluga107)
		(to_load dummy-type dummy-slot beluga108)
		(to_load dummy-type dummy-slot beluga109)
		(to_load dummy-type dummy-slot beluga110)
		(to_load dummy-type dummy-slot beluga111)
		(to_load dummy-type dummy-slot beluga112)
		(to_load dummy-type dummy-slot beluga113)
		(to_load dummy-type dummy-slot beluga114)
		(to_load dummy-type dummy-slot beluga115)
		(to_load dummy-type dummy-slot beluga116)
		(to_load dummy-type dummy-slot beluga117)
		(to_load dummy-type dummy-slot beluga118)
		(to_load dummy-type dummy-slot beluga119)
		(to_load dummy-type dummy-slot beluga120)
		(to_load dummy-type dummy-slot beluga121)
		(to_load dummy-type dummy-slot beluga122)
		(to_load dummy-type dummy-slot beluga123)
		(to_load dummy-type dummy-slot beluga124)
		(to_load dummy-type dummy-slot beluga125)
		(to_load dummy-type dummy-slot beluga126)
		(to_load dummy-type dummy-slot beluga127)
		(to_load dummy-type dummy-slot beluga128)
		(to_load dummy-type dummy-slot beluga129)
		(to_load dummy-type dummy-slot beluga130)
		(to_load dummy-type dummy-slot beluga131)
		(to_load dummy-type dummy-slot beluga132)
		(to_load dummy-type dummy-slot beluga133)
		(to_load dummy-type dummy-slot beluga134)
		(to_load dummy-type dummy-slot beluga135)
		(to_load dummy-type dummy-slot beluga136)
		(to_load dummy-type dummy-slot beluga137)
		(to_load dummy-type dummy-slot beluga138)
		(to_load dummy-type dummy-slot beluga139)
		(to_load dummy-type dummy-slot beluga140)
		(to_load dummy-type dummy-slot beluga141)
		(to_load dummy-type dummy-slot beluga142)
		(to_load dummy-type dummy-slot beluga143)
		(to_load dummy-type dummy-slot beluga144)
		(to_load dummy-type dummy-slot beluga145)
		(to_load dummy-type dummy-slot beluga146)
		(to_load dummy-type dummy-slot beluga147)
		(to_load dummy-type dummy-slot beluga148)
		(to_load dummy-type dummy-slot beluga149)
		(to_load dummy-type dummy-slot beluga150)
		(to_load dummy-type dummy-slot beluga151)
		(to_load dummy-type dummy-slot beluga152)
		(to_load dummy-type dummy-slot beluga153)
		(to_load dummy-type dummy-slot beluga154)
		(to_load dummy-type dummy-slot beluga155)
		(to_load dummy-type dummy-slot beluga156)
		(to_load dummy-type dummy-slot beluga157)
		(to_load dummy-type dummy-slot beluga158)
		(to_load dummy-type dummy-slot beluga159)
		(to_load dummy-type dummy-slot beluga160)
		(to_load dummy-type dummy-slot beluga161)
		(to_load dummy-type dummy-slot beluga162)
		(to_load dummy-type dummy-slot beluga163)
		(to_load dummy-type dummy-slot beluga164)
		(to_load dummy-type dummy-slot beluga165)
		(to_load dummy-type dummy-slot beluga166)
		(to_load dummy-type dummy-slot beluga167)
		(to_load dummy-type dummy-slot beluga168)
		(to_load dummy-type dummy-slot beluga169)
		(to_load dummy-type dummy-slot beluga170)
		(to_load dummy-type dummy-slot beluga171)
		(to_load dummy-type dummy-slot beluga172)
		(to_load dummy-type dummy-slot beluga173)
	))
  (:metric minimize (total-cost))
)