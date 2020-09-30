
% Capacitor data from http://ksim.kemet.com/Ceramic/CeramicCapSelection.aspx
% Capacitors and associated parameter arrays ordered as follows : 
% caps = [C0402C223K5RACAUTO(50volt), C1206C104KARACAUTO(250volt),
% C1812C334KCRAC(500volts), C1812C154KDRAC(1000volts),
% C2225C104KFRAC(1500volts), C1812C103KGRAC(2000volts),
% C2225C102KHRAC(3000volts)];



function [C,RC] = capacitorESR(minC,swFreq,V_out)
%Determine a capacitance and equivalent series resistance based on the
%system's minimum capacitace requirement, switching frequency, and required
%max voltage rating

%Initialize for logical comparisons:
C = 0; 

%Initial number of capacitors/capacitor branches in parallel:
numCaps_parallel = 1;

%Initial number of capacitors in series per branch:  
numCaps_series = 1;

%Logic flag indicating the voltage across each individual capacitor is
%greater than the highest available voltage rating in our data ratedVoltage
%is in volts. Each entry corresponds to a different capacitor from
%ksim.kemet:
vTooHigh = false;

%Voltage ratings of capacitors. Each entry corresponds to a different capacitor from ksim.kemet
ratedVoltage = [50,250,500,1000,1500,2000,3000];

%caps is in Farads. Each entry corresponds to a different capacitor from ksim.kemet
caps = [22e-9, 100e-9, 330e-9, 150e-9, 100e-9, 10e-9, 1e-9];

%freqRange is in Hertz. Each entry corresponds to a different capacitor from ksim.kemet
freqRange = [1	1.047129	1.096478	1.148154	1.202264	1.258925	1.318257	1.380384	1.44544	1.513561	1.584893	1.659587	1.737801	1.819701	1.905461	1.995262	2.089296	2.187762	2.290868	2.398833	2.511886	2.630268	2.754229	2.884032	3.019952	3.162278	3.311311	3.467369	3.63078	3.801894	3.981072	4.168694	4.365158	4.570882	4.786301	5.011872	5.248075	5.495409	5.754399	6.025596	6.309574	6.606935	6.918309	7.24436	7.585776	7.943282	8.317638	8.709636	9.120108	9.549926	10	10.47128	10.96478	11.48153	12.02265	12.58925	13.18257	13.80384	14.4544	15.13561	15.84893	16.59587	17.37801	18.19701	19.05461	19.95262	20.89296	21.87762	22.90868	23.98833	25.11886	26.30268	27.54229	28.84032	30.19952	31.62278	33.11311	34.67368	36.3078	38.01894	39.81072	41.68694	43.65158	45.70882	47.863	50.11873	52.48075	54.95409	57.54399	60.25595	63.09573	66.06935	69.18311	72.4436	75.85776	79.43282	83.17637	87.09637	91.2011	95.49926	100	104.7129	109.6478	114.8153	120.2264	125.8925	131.8256	138.0385	144.544	151.3562	158.4893	165.9587	173.7801	181.9701	190.5461	199.5262	208.9296	218.7761	229.0867	239.8834	251.1887	263.0269	275.4229	288.4032	301.9952	316.2278	331.1311	346.7368	363.078	380.1893	398.1071	416.8693	436.5159	457.0883	478.6302	501.1873	524.8075	549.5409	575.4399	602.5596	630.9573	660.6934	691.8308	724.4358	758.5778	794.3284	831.7639	870.9637	912.0109	954.9926	1000	1047.129	1096.478	1148.153	1202.264	1258.925	1318.256	1380.385	1445.44	1513.562	1584.893	1659.587	1737.801	1819.701	1905.461	1995.262	2089.296	2187.761	2290.867	2398.833	2511.887	2630.269	2754.229	2884.032	3019.952	3162.278	3311.311	3467.368	3630.78	3801.893	3981.071	4168.693	4365.159	4570.883	4786.302	5011.873	5248.075	5495.409	5754.399	6025.596	6309.573	6606.934	6918.308	7244.358	7585.778	7943.284	8317.64	8709.637	9120.109	9549.927	10000	10471.29	10964.78	11481.54	12022.64	12589.25	13182.56	13803.84	14454.39	15135.61	15848.92	16595.86	17378	18197.02	19054.62	19952.63	20892.97	21877.62	22908.68	23988.34	25118.87	26302.68	27542.29	28840.32	30199.52	31622.78	33113.11	34673.68	36307.8	38018.93	39810.71	41686.93	43651.57	45708.8	47862.99	50118.7	52480.72	54954.06	57544.02	60255.99	63095.76	66069.37	69183.13	72443.62	75857.78	79432.84	83176.39	87096.37	91201.09	95499.27	100000	104712.9	109647.8	114815.3	120226.4	125892.5	131825.6	138038.4	144543.9	151356.1	158489.3	165958.6	173780	181970.2	190546.2	199526.3	208929.7	218776.2	229086.8	239883.4	251188.7	263026.8	275422.9	288403.2	301995.2	316227.8	331131.1	346736.8	363078	380189.3	398107.1	416869.3	436515.7	457088	478629.9	501187	524807.2	549540.6	575440.3	602559.9	630957.6	660693.7	691831.2	724436.2	758577.8	794328.4	831763.9	870963.7	912010.9	954992.6	1000000	1047129	1096478	1148154	1202264	1258925	1318256	1380384	1445439	1513561	1584893	1659586	1737800	1819702	1905462	1995263	2089297	2187763	2290868	2398834	2511887	2630269	2754229	2884032	3019952	3162278	3311311	3467368	3630780	3801893	3981071	4168693	4365157	4570881	4786299	5011870	5248072	5495406	5754403	6025599	6309576	6606937	6918312	7244362	7585778	7943284	8317639	8709637	9120109	9549926	1.00E+07
            ];

%esrMATRIX is in Ohms. Each row corresponds to a different capacitor from ksim.kemet.
%each column is an equivalent series resistance corresponding to a
%frequency given in the freqRange vector above.
esrMATRIX =[134312.5	128218.5	122403.4	116854.1	111557.9	106503.8	101679.9	97075.09	92680.6	88486.18	84482.63	80660.75	77012.72	73530.63	70206.88	67033.35	64004.1	61112.52	58351.94	55716.43	53200.27	50798.07	48504.96	46315.37	44224.9	42229.32	40323.79	38504.49	36767.51	35108.88	33525.5	32013.54	30569.96	29191.46	27875.31	26618.5	25418.69	24272.79	23178.71	22134.07	21136.52	20184.06	19274.52	18405.96	17576.66	16784.72	16028.56	15306.47	14616.91	13958.51	13329.67	12729.33	12155.87	11608.47	11085.65	10586.37	10109.58	9654.268	9219.52	8804.346	8407.869	8029.246	7667.724	7322.433	6992.734	6677.881	6377.203	6090.066	5815.856	5554.029	5303.954	5065.172	4837.139	4619.373	4411.382	4212.81	4023.177	3842.03	3669.087	3503.905	3346.183	3195.539	3051.696	2914.328	2783.127	2657.848	2538.225	2423.971	2314.859	2210.659	2111.15	2016.119	1925.367	1838.699	1755.933	1676.903	1601.43	1529.344	1460.502	1394.769	1331.986	1272.038	1214.784	1160.104	1107.896	1058.028	1010.408	964.9277	921.4985	880.0216	840.4142	802.5923	766.4656	731.9722	699.0291	667.5667	637.5225	608.8326	581.4248	555.2595	530.2703	506.4045	483.6143	461.8486	441.0639	421.2134	402.2578	384.1539	366.8639	350.3555	334.5869	319.5311	305.1517	291.4188	278.3049	265.7786	253.8186	242.3962	231.4886	221.0711	211.1233	201.6225	192.5498	183.885	175.6094	167.708	160.1617	152.9545	146.0721	139.5	133.2231	127.2288	121.5042	116.0371	110.8161	105.8307	101.0689	96.5219	92.17956	88.03258	84.07213	80.28988	76.67779	73.2282	69.93427	66.78849	63.78422	60.91512	58.17543	55.55857	53.0598	50.67342	48.39469	46.21813	44.13975	42.15512	40.25945	38.44929	36.72052	35.06948	33.4929	31.9872	30.54938	29.1762	27.86475	26.61243	25.41639	24.27427	23.18347	22.14184	21.14701	20.19702	19.2897	18.4234	17.59587	16.80575	16.05111	15.33046	14.64226	13.98496	13.35736	12.75791	12.18545	11.63884	11.11674	10.61815	10.14205	9.687363	9.253127	8.838417	8.442409	8.0642	7.702987	7.35805	7.028659	6.714108	6.41368	6.126778	5.852788	5.59113	5.341244	5.102597	4.874713	4.657103	4.449266	4.250765	4.061232	3.880202	3.707344	3.542236	3.384598	3.234019	3.090245	2.952924	2.821782	2.696558	2.576961	2.462752	2.353667	2.249509	2.150034	2.055027	1.964313	1.877667	1.794928	1.715917	1.640451	1.568388	1.499572	1.433844	1.37107	1.311133	1.253892	1.199222	1.14702	1.097163	1.049551	1.004084	0.9606631	0.9191926	0.8795934	0.8417773	0.8056551	0.7711626	0.738224	0.7067651	0.6767251	0.6480365	0.620639	0.594471	0.5694854	0.545625	0.522836	0.5010729	0.4802896	0.4604413	0.4414853	0.4233864	0.4060996	0.3895924	0.3738239	0.358769	0.3443898	0.3306606	0.3175446	0.3050227	0.293064	0.2816417	0.2707346	0.260318	0.2503709	0.2408712	0.2317983	0.2231347	0.2148611	0.2069599	0.1994132	0.1922072	0.1853251	0.1787538	0.1724768	0.1664829	0.1607593	0.1552928	0.1500716	0.1450859	0.1403257	0.1357788	0.1314368	0.1272894	0.1233293	0.1195474	0.115936	0.1124869	0.1091926	0.1060473	0.1030434	0.1001741	0.09743442	0.09481813	0.09231949	0.0899333	0.08765469	0.08547816	0.0834	0.08141509	0.07951993	0.07770979	0.07598082	0.0743302	0.07275367	0.07124804	0.06981021	0.06843701	0.06712581	0.06587347	0.06467767	0.0635356	0.06244481	0.06140318	0.06040854	0.05945856	0.05855149	0.05768514	0.05685767	0.05606758	0.05531314	0.05459257	0.05390441	0.05324722	0.05261966;
            19504.96	18616.33	17768.69	16960.13	16188.67	15452.75	14750.42	14080.55	13441.24	12831.19	12249.07	11693.47	11163.29	10657.35	10174.43	9713.589	9273.708	8853.918	8453.211	8070.719	7705.606	7357.084	7024.459	6706.874	6403.708	6114.365	5838.096	5574.363	5322.595	5082.199	4852.754	4633.668	4424.474	4224.804	4034.187	3852.131	3678.327	3512.399	3353.956	3202.692	3058.249	2920.349	2788.667	2662.923	2542.874	2428.236	2318.767	2214.276	2114.494	2019.188	1928.197	1841.306	1758.331	1679.111	1603.46	1531.233	1462.245	1396.365	1333.466	1273.401	1216.053	1161.276	1108.978	1059.024	1011.34	965.7944	922.2993	880.7632	841.1061	803.2345	767.0605	732.53	699.5469	668.0427	637.9695	609.2443	581.8182	555.6266	530.6142	506.7226	483.9164	462.1276	441.3284	421.4571	402.4885	384.3734	367.0702	350.5493	334.7687	319.7017	305.3098	291.5714	278.4485	265.9163	253.9481	242.5186	231.6034	221.1817	211.2269	201.7221	192.645	183.9745	175.6976	167.79	160.2413	153.0294	146.1449	139.5686	133.2898	127.2909	121.5644	116.0944	110.8727	105.8848	101.1204	96.57134	92.22783	88.07883	84.11649	80.33317	76.72004	73.26946	69.97339	66.82692	63.82132	60.95152	58.21077	55.59271	53.09294	50.70559	48.42606	46.24904	44.16986	42.18377	40.28779	38.47703	36.74766	35.09637	33.51896	32.01279	30.57459	29.20101	27.88887	26.63597	25.43959	24.29721	23.2059	22.16407	21.16879	20.21862	19.3111	18.44426	17.6167	16.82626	16.07129	15.35051	14.66205	14.00447	13.37651	12.77698	12.20431	11.65743	11.13528	10.63653	10.16021	9.705418	9.270986	8.856179	8.460018	8.081737	7.720454	7.375397	7.045905	6.731202	6.430684	6.143711	5.869661	5.607893	5.357963	5.119274	4.891268	4.673607	4.465676	4.267128	4.07753	3.896437	3.723536	3.55838	3.400653	3.250047	3.106206	2.96885	2.837683	2.712393	2.592737	2.478486	2.369388	2.265183	2.16569	2.07065	1.979899	1.893239	1.810461	1.731423	1.655949	1.583859	1.515012	1.449271	1.386477	1.326521	1.269268	1.214581	1.162362	1.112483	1.064858	1.019369	0.9759346	0.9344572	0.8948436	0.8570054	0.8208826	0.7863769	0.7534258	0.7219618	0.6919125	0.6632097	0.6358067	0.6096337	0.584631	0.5607631	0.5379628	0.5161975	0.4954058	0.4755529	0.4565914	0.4384848	0.4211934	0.4046795	0.3889065	0.3738472	0.3594643	0.3457286	0.3326092	0.3200794	0.308116	0.2966935	0.2857828	0.2753632	0.2654122	0.2559103	0.2468346	0.2381652	0.2298902	0.2219852	0.2144372	0.2072286	0.2003456	0.1937701	0.1874909	0.181495	0.1757701	0.1703017	0.1650781	0.1600914	0.1553286	0.1507807	0.1464362	0.1422889	0.1383274	0.134544	0.1309315	0.1274813	0.1241858	0.1210397	0.1180347	0.1151642	0.1124237	0.1098065	0.1073069	0.10492	0.1026407	0.1004635	0.09838472	0.0963991	0.09450271	0.09269237	0.09096274	0.08931129	0.08773443	0.08622839	0.08479012	0.08341649	0.08210462	0.08085196	0.07965539	0.07851309	0.07742187	0.07638006	0.07538506	0.07443453	0.07352723	0.07266057	0.07183272	0.07104238	0.07028752	0.06956671	0.06887829	0.06822097	0.06759299	0.06699342	0.06642094	0.06587409	0.06535181	0.06485319	0.06437686	0.06392211	0.06348775	0.06307296	0.06267688	0.06229861	0.0619373	0.06159233	0.06126289	0.0609483	0.06064783	0.06036092	0.060087	0.0598253	0.05957548	0.05933684	0.05910902	0.05889146	0.05868372	0.05848529	0.05829587	0.05811498	0.05794225	0.05777733	0.05761987	0.05746954	0.057326	0.05718897	0.05705816	0.05693325	0.05681405	0.05670027	0.05659167	0.05550532	0.05545064	0.05539853	0.05534885;
            4630.684	4419.06	4217.209	4024.726	3841.121	3665.98	3498.955	3339.619	3187.618	3042.609	2904.232	2772.251	2646.299	2526.133	2411.451	2302.034	2197.608	2097.944	2002.85	1912.09	1825.465	1742.808	1663.893	1588.571	1516.696	1448.074	1382.573	1320.052	1260.373	1203.407	1149.016	1097.097	1047.537	1000.215	955.0436	911.9233	870.7496	831.4456	793.9155	758.0795	723.879	691.213	660.0293	630.2523	601.8262	574.6823	548.7693	524.0249	500.3962	477.8329	456.2927	435.7236	416.0868	397.3301	379.4236	362.3241	345.9952	330.4064	315.5159	301.3003	287.7252	274.7651	262.3856	250.5669	239.2776	228.4998	218.2074	208.3786	198.9951	190.0318	181.4743	173.3001	165.4962	158.0437	150.9268	144.1304	137.64	131.4419	125.5229	119.8719	114.474	109.3204	104.3976	99.69767	95.20935	90.92194	86.82868	82.91972	79.18673	75.6218	72.21737	68.96617	65.86137	62.89633	60.06477	57.36143	54.77905	52.31358	49.95846	47.70996	45.56209	43.51104	41.5522	39.68195	37.89578	36.18992	34.56119	33.00565	31.51967	30.10127	28.74591	27.45219	26.21661	25.03659	23.90962	22.83361	21.80569	20.82425	19.88693	18.99174	18.13704	17.32076	16.54118	15.79684	15.08557	14.40666	13.75826	13.13902	12.54776	11.98294	11.44365	10.92861	10.43671	9.967056	9.518394	9.090018	8.680901	8.290174	7.917113	7.560819	7.220543	6.895561	6.585274	6.288851	6.005829	5.735532	5.477456	5.230845	4.99545	4.770638	4.555987	4.350947	4.155135	3.968134	3.789598	3.61905	3.456175	3.30063	3.152128	3.010267	2.874828	2.745448	2.621891	2.503926	2.391238	2.283651	2.180904	2.082754	1.989046	1.899554	1.814042	1.732424	1.654479	1.58004	1.508951	1.44106	1.376224	1.314304	1.255171	1.198714	1.144781	1.093276	1.0441	0.9971238	0.9522736	0.9094407	0.8685234	0.8294576	0.792149	0.7565187	0.7225003	0.6900027	0.6589669	0.6293352	0.6010357	0.5740091	0.5481977	0.5235472	0.5000049	0.4775214	0.456055	0.4355534	0.4159735	0.397274	0.3794149	0.3623636	0.3460785	0.3305253	0.3156711	0.3014886	0.2879431	0.2750063	0.2626507	0.2508533	0.2395861	0.2288249	0.2185501	0.2087366	0.1993663	0.1904168	0.1818689	0.1737072	0.1659117	0.1584681	0.1513585	0.1445698	0.1380875	0.1318958	0.1259817	0.1203344	0.1149419	0.1097923	0.1048736	0.1001765	0.09569105	0.09140767	0.08731718	0.08341084	0.07967918	0.07611656	0.0727142	0.06946484	0.06636153	0.06339772	0.06056786	0.05786508	0.05528361	0.05281871	0.05046503	0.04821682	0.04606999	0.0440193	0.04206154	0.04019187	0.03840579	0.03670051	0.03507229	0.0335167	0.03203134	0.03061296	0.0292585	0.02796501	0.02672934	0.02554952	0.02442303	0.02334705	0.02231925	0.02133803	0.02040091	0.01950587	0.01865122	0.01783506	0.01705538	0.01631115	0.01560027	0.0149212	0.01427302	0.01365371	0.01306246	0.01249775	0.01195849	0.01144347	0.01095168	0.01048199	0.01003349	0.009605017	0.009195968	0.008805274	0.008432248	0.008075923	0.007735669	0.007410681	0.007100376	0.006804089	0.006521017	0.006250725	0.005992616	0.005746122	0.005510756	0.005285916	0.005071219	0.004866215	0.004670412	0.004483442	0.004304889	0.004134345	0.003971461	0.003815933	0.00366741	0.003525584	0.003390105	0.003260743	0.003137212	0.003019219	0.00290657	0.002798948	0.002696209	0.002598066	0.002504347	0.00241485	0.002329383	0.00224776	0.002169815	0.002095382	0.002024291	0.001956402	0.001891567	0.00182964	0.001770511	0.001714045	0.001660113	0.001608614	0.001559431	0.001512468	0.001467615	0.001424771	0.00138387	0.001344799	0.000955649	0.000935858	0.000916957	0.000898902	0.000881663	0.000865198	0.000849475	0.000834459	0.00082012	0.000806426	0.000793348	0.000780858	0.000768932;
            16226.09	15488.74	14785.23	14113.9	13473.25	12861.88	12278.54	11721.83	11190.53	10683.48	10199.48	9737.639	9296.779	8875.946	8474.293	8090.941	7724.992	7375.65	7042.213	6723.905	6420.033	6129.989	5853.048	5588.749	5336.343	5095.375	4865.328	4645.701	4436.024	4235.843	4044.695	3862.203	3687.974	3521.604	3362.766	3211.116	3066.306	2928.048	2796.025	2669.976	2549.608	2434.667	2324.927	2220.149	2120.077	2024.548	1933.308	1846.194	1763.005	1683.578	1607.717	1535.286	1466.13	1400.078	1337.012	1276.787	1219.274	1164.362	1111.922	1061.836	1014.022	968.353	924.7411	883.1002	843.3279	805.3532	769.0881	734.462	701.3895	669.8061	639.6498	610.8467	583.3448	557.0813	532.0003	508.0484	485.1749	463.3312	442.4744	422.5531	403.5289	385.364	368.0142	351.4481	335.6277	320.5168	306.0888	292.3125	279.152	266.5881	254.5877	243.1274	232.183	221.7314	211.7518	202.2199	193.117	184.4238	176.1234	168.1952	160.6239	153.3946	146.4899	139.8973	133.5996	127.5867	121.8437	116.3594	111.1223	106.1211	101.3444	96.78291	92.42692	88.26649	84.29417	80.50019	76.8765	73.41668	70.1127	66.95699	63.94299	61.06529	58.31675	55.69247	53.18557	50.79202	48.50591	46.32279	44.23803	42.24718	40.34569	38.52987	36.79583	35.13993	33.55836	32.04803	30.60575	29.22843	27.91272	26.65671	25.45687	24.31128	23.2173	22.17241	21.17459	20.22172	19.31162	18.44253	17.61257	16.81988	16.06302	15.34015	14.64981	13.99054	13.36093	12.75976	12.18554	11.63726	11.11355	10.6135	10.13588	9.679816	9.244204	8.828266	8.431043	8.051693	7.689409	7.34343	7.013017	6.697467	6.39617	6.108377	5.833536	5.571105	5.320478	5.081088	4.852468	4.634173	4.425733	4.226635	4.036493	3.854936	3.681545	3.515925	3.357783	3.206781	3.062545	2.92482	2.793265	2.66765	2.547705	2.433133	2.323732	2.219251	2.119466	2.024169	1.933173	1.846268	1.763269	1.684016	1.608325	1.536036	1.467008	1.401082	1.33813	1.278007	1.220585	1.165753	1.113384	1.063377	1.015624	0.9700153	0.9264551	0.8848649	0.8451356	0.8072035	0.7709741	0.7363769	0.703338	0.6717817	0.6416517	0.6128733	0.5853905	0.5591494	0.5340848	0.5101479	0.4872881	0.4654603	0.444614	0.424705	0.4056908	0.3875345	0.3701939	0.353635	0.3378225	0.3227199	0.3082975	0.2945223	0.2813692	0.2688084	0.2568105	0.2453542	0.2344149	0.2239652	0.2139885	0.2044596	0.1953583	0.1866684	0.1783694	0.1704437	0.1628742	0.155646	0.1487423	0.1421507	0.1358546	0.1298417	0.1240999	0.118617	0.1133809	0.1083795	0.1036038	0.09904341	0.09468758	0.09052758	0.08655535	0.08276209	0.07913951	0.0756797	0.07237516	0.06921988	0.06620687	0.06332895	0.06058091	0.05795661	0.05545029	0.05305641	0.05077057	0.04858764	0.04650316	0.04451209	0.04261107	0.04079511	0.03906118	0.03740529	0.03582402	0.03431373	0.0328713	0.03149395	0.03017869	0.02892255	0.02772281	0.02657733	0.02548319	0.02443842	0.02344053	0.02248769	0.02157759	0.02070853	0.01987868	0.01908614	0.01832924	0.01760634	0.016916	0.01625682	0.01562721	0.01502596	0.01445178	0.01390343	0.01337979	0.01287976	0.01240218	0.01194608	0.01151051	0.01109458	0.01069731	0.01031797	0.009955687	0.009609735	0.009279294	0.008963779	0.008662459	0.008374682	0.008099875	0.007837409	0.0075868	0.007347406	0.007118828	0.006900567	0.006692073	0.006492984	0.006302873	0.006121296	0.005947893	0.005782275	0.005624129	0.005473119	0.005328886	0.005191155	0.005059632	0.004934005	0.004814048	0.004699485	0.004590079	0.004485607	0.004385822	0.004290538	0.004199537	0.003293079	0.003246973	0.003202938	0.003160894;
            39208.59	37433.33	35738.79	34121.45	32577.61	31103.92	29697.32	28354.59	27072.84	25849.27	24681.12	23566.11	22501.56	21485.32	20515.07	19588.82	18704.48	17860.15	17054.1	16284.5	15549.71	14848.22	14178.37	13538.8	12928.21	12345.16	11788.46	11256.92	10749.39	10264.8	9802.053	9360.212	8938.333	8535.464	8150.795	7783.499	7432.754	7097.815	6778.036	6472.632	6181.017	5902.568	5636.667	5382.74	5140.279	4908.739	4687.652	4476.522	4274.901	4082.361	3898.512	3722.961	3555.297	3395.2	3242.312	3096.31	2956.882	2823.746	2696.592	2575.176	2459.226	2348.509	2242.765	2141.793	2045.357	1953.273	1865.334	1781.354	1701.164	1624.575	1551.443	1481.595	1414.898	1351.204	1290.377	1232.289	1176.821	1123.845	1073.253	1024.944	978.8044	934.7465	892.6674	852.4866	814.1146	777.4657	742.4704	709.0536	677.1378	646.6584	617.5511	589.7538	563.2078	537.8568	513.6467	490.5312	468.4514	447.3653	427.2285	408.0002	389.6371	372.1008	355.3521	339.3573	324.0842	309.4956	295.5665	282.2643	269.5597	257.4282	245.8416	234.7765	224.2106	214.1182	204.4822	195.2789	186.4898	178.0964	170.0816	162.4259	155.1156	148.1352	141.4682	135.1007	129.0204	123.2144	117.6691	112.3734	107.3161	102.4859	97.87364	93.46898	89.26249	85.24539	81.4091	77.74547	74.24636	70.90511	67.71424	64.66699	61.75689	58.97776	56.32371	53.7891	51.36855	49.05696	46.8494	44.74098	42.72767	40.80497	38.9688	37.21534	35.54078	33.94159	32.41434	30.95581	29.56292	28.23268	26.96246	25.74924	24.59075	23.48437	22.42778	21.41872	20.45506	19.53486	18.65596	17.8166	17.01509	16.24971	15.5187	14.82063	14.15398	13.51731	12.90928	12.32866	11.77415	11.24459	10.7389	10.25595	9.794715	9.354276	8.933637	8.531918	8.148304	7.781938	7.432047	7.097957	6.778852	6.474127	6.183131	5.905215	5.639819	5.386352	5.1443	4.913151	4.69239	4.481573	4.280247	4.087987	3.904364	3.729026	3.561562	3.401638	3.24891	3.103073	2.963782	2.830771	2.703731	2.582419	2.466575	2.355929	2.25028	2.149367	2.053013	1.960979	1.8731	1.789169	1.709024	1.632479	1.559378	1.489574	1.422909	1.359242	1.298443	1.240378	1.184927	1.131973	1.081402	1.033107	0.9869834	0.9429391	0.9008743	0.8607037	0.8223417	0.7857056	0.7507213	0.7173057	0.6853981	0.6549276	0.6258245	0.5980334	0.5714939	0.546149	0.5219445	0.4988281	0.4767526	0.4556705	0.4355386	0.4163109	0.3979504	0.3804153	0.3636695	0.3476768	0.3324043	0.3178205	0.3038917	0.2905897	0.2778867	0.2657564	0.2541709	0.2431074	0.2325407	0.2224506	0.2128144	0.2036118	0.1948233	0.1864306	0.1784161	0.1707618	0.1634517	0.1564703	0.1498037	0.1434375	0.1373575	0.1315507	0.1260059	0.1207105	0.1156532	0.110824	0.106212	0.101807	0.09760098	0.09358407	0.08974791	0.08608397	0.08258532	0.07924449	0.07605345	0.07300626	0.0700962	0.06731725	0.06466299	0.06212843	0.05970795	0.05739659	0.0551891	0.05308098	0.05106732	0.04914482	0.04730867	0.04555513	0.04388058	0.04228144	0.04075412	0.03929568	0.03790299	0.03657275	0.03530253	0.03408934	0.03293079	0.03182444	0.03076786	0.02975875	0.02879516	0.02787495	0.02699612	0.02615687	0.02535531	0.02458988	0.02385898	0.02316089	0.02249425	0.02185755	0.02124957	0.02066892	0.02011445	0.01958492	0.01907916	0.01859624	0.01813505	0.01769464	0.01727398	0.01687227	0.01648867	0.01612231	0.01577245	0.01543831	0.01511926	0.01481455	0.01452354	0.01424566	0.01398026	0.01372682	0.01348478	0.01325365	0.01303289	0.01282212	0.0126208	0.01242854	0.01224497;
            836625.4	798865.5	762813.1	728392.9	695528.8	664150.4	634192.1	605587.5	578275.9	552198.4	527299.3	503525.1	480824	459147.3	438449.8	418687.2	399816.3	381797.6	364590.9	348161.4	332473.7	317492.8	303187.6	289528.2	276484.3	264028.6	252135.1	240777.5	229931.4	219574.9	209684.9	200241.2	191222.5	182610.7	174387.2	166533.6	159033.7	151872.6	145033.3	138503	132266	126310.2	120622.9	115191.9	110005.4	105052.5	100322.5	95805.77	91492.38	87373.36	83439.79	79683.31	76095.94	72670.08	69398.76	66274.55	63291.14	60441.89	57721.04	55122.69	52641.27	50271.46	48008.56	45847.4	43783.74	41812.76	39930.61	38133.26	36416.65	34777.48	33212.09	31717.16	30289.44	28926.06	27624.05	26380.65	25193.21	24059.22	22976.32	21942.12	20954.51	20011.31	19110.62	18250.42	17428.97	16644.5	15895.34	15179.86	14496.62	13844.14	13221.02	12625.95	12057.66	11514.97	10996.69	10501.73	10029.06	9577.695	9146.605	8734.922	8341.786	7966.315	7607.77	7265.367	6938.35	6626.074	6327.843	6043.036	5771.044	5511.3	5263.261	5026.358	4800.142	4584.091	4377.778	4180.736	3992.583	3812.867	3641.27	3477.379	3320.877	3171.408	3028.669	2892.357	2762.182	2637.862	2519.135	2405.758	2297.481	2194.079	2095.328	2001.024	1910.96	1824.957	1742.818	1664.381	1589.471	1517.935	1449.617	1384.374	1322.066	1262.564	1205.74	1151.475	1099.65	1050.159	1002.895	957.7576	914.6532	873.4876	834.1753	796.632	760.7784	726.5399	693.8392	662.612	632.7914	604.3114	577.1148	551.1409	526.3372	502.6485	480.0271	458.4229	437.7928	418.0893	399.2735	381.3045	364.1441	347.7559	332.1053	317.1592	302.8857	289.2553	276.2375	263.8063	251.9338	240.5964	229.769	219.4289	209.5542	200.1239	191.1178	182.5175	174.3039	166.4603	158.9693	151.8161	144.9841	138.4601	132.2295	126.2795	120.5973	115.1707	109.9883	105.0391	100.3128	95.79926	91.48877	87.37243	83.44108	79.68685	76.10169	72.67769	69.40789	66.2852	63.30316	60.45528	57.73552	55.13824	52.65793	50.28907	48.0269	45.86666	43.80342	41.8332	39.9516	38.15473	36.43867	34.79995	33.23494	31.7403	30.31304	28.94996	27.64823	26.4051	25.21787	24.08413	23.00143	21.9674	20.97995	20.03694	19.13636	18.27635	17.45499	16.67063	15.92159	15.20621	14.52306	13.87065	13.24762	12.6526	12.0844	11.54174	11.02353	10.52862	10.056	9.604645	9.173615	8.761972	8.368864	7.993433	7.634918	7.292521	6.965548	6.653299	6.355082	6.070305	5.798334	5.538603	5.290571	5.053699	4.82749	4.611447	4.405145	4.208123	4.019972	3.840284	3.668688	3.504814	3.348309	3.198855	3.056127	2.919816	2.789648	2.665334	2.546618	2.433243	2.324973	2.221569	2.122826	2.028528	1.93847	1.852465	1.770336	1.691898	1.616994	1.545463	1.477145	1.411906	1.349604	1.290103	1.233282	1.179015	1.127195	1.077706	1.030443	0.9853097	0.9422058	0.9010429	0.8617325	0.8241927	0.7883373	0.7541013	0.7214029	0.690178	0.6603583	0.6318812	0.6046833	0.5787105	0.5539086	0.5302218	0.507601	0.4859961	0.4653664	0.4456643	0.4268495	0.4088808	0.3917213	0.3753347	0.3596842	0.3447386	0.3304662	0.3168356	0.3038186	0.291388	0.2795165	0.2681789	0.2573518	0.2470124	0.2371382	0.227708	0.2187024	0.2101028	0.2018896	0.1940459	0.186556	0.1794025	0.172571	0.1660471	0.1598171	0.1538673	0.1481851	0.1427589	0.1375768	0.1326279	0.1279019	0.1233887	0.1190785	0.1149624	0.1110312;
            8447301	8056458	7684197	7329484	6991573	6669526	6362662	6070165	5791409	5525646	5272333	5030800	4800520	4580944	4371565	4171886	3981450	3799817	3626583	3461332	3303698	3153328	3009869	2873000	2742417	2617822	2498938	2385495	2277249	2173949	2075371	1981290	1891509	1805820	1724037	1645975	1571470	1500360	1432478	1367686	1305836	1246798	1190439	1136638	1085279	1036250	989441.8	944756.9	902094.3	861365.9	822481.9	785357.1	749914.5	716073.1	683764.9	652916.3	623463.4	595342.1	568491.5	542854.5	518374.7	495002.2	472684.7	451375.4	431027.8	411599.3	393047.3	375333.3	358418.5	342266.8	326843.6	312116.1	298053.5	284624.7	271801.4	259557.1	247864.4	236698.9	226037	215855.3	206133.1	196848.9	187983.2	179516.9	171432.2	163711.5	156339.4	149298.9	142576.1	136155.7	130024.7	124170.1	118579.1	113239.8	108141.2	103272.2	98622.59	94182.32	89941.98	85892.56	82025.63	78332.77	74806.39	71438.66	68222.59	65151.32	62218.26	59417.36	56742.64	54188.1	51748.98	49419.33	47194.7	45070.25	43041.55	41103.93	39253.64	37486.75	35799.35	34187.82	32648.96	31179.39	29775.85	28435.57	27155.65	25933.29	24765.98	23651.27	22586.66	21569.98	20599.13	19671.9	18786.45	17940.88	17133.3	16362.16	15625.67	14922.37	14250.71	13609.28	12996.71	12411.75	11853.07	11319.57	10810.09	10323.55	9858.873	9415.117	8991.36	8586.665	8200.171	7831.102	7478.625	7142.033	6820.571	6513.579	6220.405	5940.437	5673.074	5417.729	5173.892	4941.004	4718.633	4506.25	4303.434	4109.738	3924.778	3748.125	3579.431	3418.322	3264.479	3117.553	2977.24	2843.235	2715.268	2593.061	2476.36	2364.905	2258.467	2156.819	2059.746	1967.047	1878.514	1793.971	1713.229	1636.125	1562.491	1492.171	1425.012	1360.879	1299.63	1241.143	1185.282	1131.941	1080.997	1032.347	985.8883	941.5185	899.1473	858.6831	820.0402	783.136	747.8928	714.2355	682.093	651.3969	622.0838	594.0897	567.3555	541.8243	517.442	494.1568	471.9207	450.6837	430.4037	411.0364	392.5417	374.878	358.0101	341.9012	326.5172	311.8261	297.796	284.3972	271.6012	259.3817	247.7119	236.5677	225.9248	215.7608	206.0546	196.785	187.9324	179.4785	171.4054	163.6953	156.3322	149.3005	142.5853	136.1724	130.0481	124.1997	118.6142	113.2802	108.1864	103.3219	98.67603	94.2394	90.00266	85.95638	82.09225	78.40224	74.87805	71.51266	68.29854	65.22919	62.2981	59.49887	56.82559	54.27266	51.83456	49.50626	47.28276	45.15932	43.13139	41.19486	39.34536	37.5792	35.8925	34.28176	32.74348	31.27445	29.8715	28.53177	27.25227	26.03041	24.86346	23.74913	22.68493	21.66851	20.69796	19.77108	18.8859	18.04058	17.23332	16.46235	15.72611	15.023	14.35152	13.71028	13.0979	12.51306	11.95455	11.42119	10.91186	10.42543	9.960883	9.517256	9.093596	8.688993	8.302625	7.933637	7.581262	7.24472	6.923345	6.616445	6.323323	6.043432	5.776117	5.520849	5.277061	5.044239	4.821906	4.609574	4.406805	4.213153	4.028231	3.851613	3.682959	3.521895	3.368081	3.221179	3.080894	2.946932	2.818991	2.69681	2.580128	2.468705	2.362289	2.260665	2.16361	2.070928	1.982417	1.897892	1.817169	1.740079	1.66646	1.596154	1.52901	1.464889	1.403657	1.345176	1.289333	1.236001	1.185068	1.136428	1.089979	1.045618	1.003258	0.9628009	0.924166
           ];

  
for vIdx = 1:length(ratedVoltage)
    if ratedVoltage(vIdx) > V_out %Found a capacitor that is rated higher than necessary voltage level
        if caps(vIdx) >= minC %Capacitance of the selected capacitor is higher than minimum capacitance (good!)
            C = caps(vIdx); %Use the selected capacitor value for C
            esrIdx = vIdx;  %Look up corresponding ESR of the cap using this index.
            break;  
        else    %Capacitance of the selected capacitor is lower than minimum capacitance (bad!)
           while C < minC %Check that capacitance is still lower than minimum tolerable
               numCaps_parallel = numCaps_parallel + 1; %Add a capacitor of the same capacitance value (and rated voltage) in parallel
               C = caps(vIdx)*numCaps_parallel; %Calculate new increased capacitance
               esrIdx = vIdx; %Look up ESR of the capacitor used. Actual resistance depending on number of caps placed in parallel with eachother will be calculated below 
           end
           break;
        end
    else
        vTooHigh = true;  %Did not find a capacitor that is rated for necessary voltage level
    end
end

%The following executes if Vout exceeds the highest voltage rating of the capacitors in available data. Solution is to put caps
%"in series" to decrease voltage across each individual capacitor:
while vTooHigh
    numCaps_series = numCaps_series + 1;    %Add another capacitor in series with current capacitor(s)
    V_indvlCap = V_out/numCaps_series; %Going to use the same capacitance for each so voltage is evenly divided across them
        for vsIdx = 1:length(ratedVoltage)  %Now that the max voltage across each capacitor is effectively decreased we can look again for a capacitor whose max rated voltage is higher than the new V_indvlCap
            if ratedVoltage(vsIdx) > V_indvlCap 
                vTooHigh = false;
                esrIdx = vsIdx; %Lookup index for  ESR of the capacitor used. Actual resistance depending on number of caps placed in series with eachother will be calculated below 
                break; 
            end
        end


%The following executes as a final check that requirements are met using total capacitance of the final network:
if (inv(inv(caps(vsIdx))*numCaps_series))*numCaps_parallel >= minC %Total Capacitance of the selected capacitors (good!)
    C = (inv(inv(caps(vsIdx))*numCaps_series))*numCaps_parallel; %Use the above value for C 
    else    %Total Capacitance of the selected capacitors in series is lower than minimum capacitance (bad!)
        while (inv(inv(caps(vsIdx))*numCaps_series)*numCaps_parallel) < minC
            numCaps_parallel = numCaps_parallel + 1; %Add a parallel branch of series capacitors to raise capacitance
            C = inv(inv(caps(vsIdx))*numCaps_series)*numCaps_parallel; %Put capacitors "in parallel" to increase capacitance using the same capacitor value with the necessary voltage rating in each new position  
        end        
end   
end
esr = spline(freqRange,esrMATRIX(esrIdx,:),swFreq); %Cubic spline interpolation of data set for ESR based on given operating frequency  
RC = inv(numCaps_parallel*inv(esr))*numCaps_series;  %Total equivalent series resitance of the capacitor network

% fprintf('Capacitance of individual Capacitor(s) = %0.3e\n', indvl_Cap)
% fprintf('ESR of individual Capacitor(s) = %0.3e\n', esr)
% fprintf('Total Capacitance = %0.3e\n',C)
% fprintf('Total ESR = %0.3e\n', RC)
% fprintf('Voltage across each individual capacitor = %0.2f\n', V_indvlCap)
% fprintf('Number of capacitors in series per parallel branch = %.0f\n', numCaps_series)
% fprintf('Number of branches of capacitors in parallel = %.0f\n',numCaps_parallel)
end