function big_sim_gluc_41()

    % Parameters
    b1 = 0.0059; %Insulin independent glucose utilization
    b2 = 0.1262; %Insulin disappearance rate
    b3 = 0.00005; %Insulin dependent glucose utilization
    b4 = 0.4543; %Glucose dependent insulin secretion
    b5 = 0.185; %Glucose transfer from liver to plasma
    b6 = 0.0102; %Intestine glucose dependent incretin secretion
    b7 = 0.03; %Incretin disappearance rate
    b8 = 0.022; %Stomach glucose emptying rate
    b9 = 0.022; %Glucose transfer rate to the stomach
    b10 = 0.022; %Intestine glucose emptying rate
    b11 = 0.02; %Ghrelin disappearance
    b12 = 28.66; %The appearance constant for ghrelin
    b13 = 0.0000095; %Leptin secretion rate
    b14 = 0.0278; %Leptin disappearance
    b17 = 0.7; %Ghrelin dependent glucose intake appearance
    b18 = 0.35; %Leptin inhibition on glucose intake
    b19 = 0.004; %Glucose effect rate on glucose intake
    b21 = 0.00876; %Glucagon action on the liver
    b22 = 0.0021; %Glucose action on the liver
    b23 = 0.08; %Liver glucose constant production
    b25 = 0.00026; %Insulin action on the liver
    b27 = 0.014; %Muscle glucose disappearance
    c = 0.1060; %Incretin dependent insulin secretion
    c0 = 1.8854; %Glucagon basal secretion
    c1 = 198; %Glucose action on Glucagon
    c2 = 94; %Insullin action on glucagon
    c3 = 0.0554; %Glucagon disappearance
    e = 1.0; %Insulin effectiveness
    Fat = 22.0; %Averaged total fat mass in humans (kg)
    f1 = 0.9; %Fraction of absorbed glucose
    Gb = 5.0; %Fasting plasma glucose (Basal level; mM)
    Ge = 5.0; %Glucose threshold value (mM)
    Ib = 60.0; %Fasting plasma insulin (Basal level; pM)
    l = 0.006; %Glucose in stomach dependent decay rate of ghrelin (mmol^-1)
    m = 0.04; %Insulin dependent decay rate of ghrelin (pM^-1)
    p2U = 0.033; %Interstitial insulin rate of change (min^-1)
    q1 = 0.0031; %Interstitial glucose elimination rate (min^-1)
    q2 = 0.4054; %Glucose transger rate from plasma to interstitium ((mg/kg)/mM.min)
    r = 0.04; %Insulin depdent decay rate of glucose intake (pM^-1)
    s = 0.03; %Incretin constant secretion (pM/min)
    v = 15; %Glucose distribution volume (liters)
    
    k1a = 0.00333; %Insulin binding with IR
    k1basal = 0.0358; %Basal phosphorylation of IR
    k1c = 0.877; %Phosphorylation of IRins
    k1d = 31.0; %Endocytosis process of IR_YP
    k1f = 0.368; %Feedback from protein X_P
    k1g = 1940; %Basal dephosphorylation of IR_YP
    k1r = 0.547; %Recycling rate of the free insulin receptor
    k2a = 3.23; %Phosphorylation of IRS1 from the receptor
    k2c = 5760; %Phosphorylation of IRS1 from the mTORC1a
    k2basal = 0.0423; %Basal phosphorylation of IRS1
    k2b = 3420; %Dephosphorylation of IRS1
    k2d = 281; %Dephosphorylation of IRS1 in the serine site
    k2f = 2.91; %Dephosphorylation of IRS1 in the tyrosine site
    k2g = 0.267; %Dephosphorylation of IRS1 in the serine site 
    %(documentation says that both k2d and k2g are as stated above)
    k3a = 6.90; %Activation of X protein
    k3b = 0.0988; %Deactivation of X protein
    k4a = 5790; %Phosphorylation of PKB
    k4b = 34.8; %Dephosphorylation of PKB
    k4c = 4.46; %Phosphorylation of PKB in the serine site
    k4e = 42.8; %Phosphorylation of PKB 
    %(documentation says that both k4a and k4e are as stated above)
    k4f = 144; %Dephosphorylation of PKB
    k4h = 0.536; %Dephosphorylation of PKB
    k5a1 = 1.84; %Activation of mTORC1 complex
    k5a2 = 0.0551; %Activation of mTORC1 complex
    k5b = 24.8; %Deactivation of mTORC1 complex
    k5c = 0.0858; %Activation of mTORC2 complex
    k5d = 1.06; %Deactivation of mTORC2 complex
    k6a1 = 2.65; %Activation of AS160
    k6a2 = 0.410; %Activation of AS160
    k6b = 65.2; %Deactivation of AS160
    k7a = 51.0; %Translocation of GLUT4 to the membrane
    k7b = 2290; %Translocation of GLUT4 to the cytosol
    k8 = 0.5275; %GLUT4 glucose uptake
    
    GLUT1 = 0.0283; %GLUT1 glucose uptake
    KmG4 = 146.851; %Dependence on interstitial glucose saturated
    KmG1 = 1.082; %Dependence on interstitial glucose saturated
    k_gluc = 0.25; %Intra-adipocitary glucose elimination rate
    k9a = 0.0013; %Phosphorylation of S6K
    k9b = 0.0444; %Dephosphorylation of S6K
    k9b2 = 30.9966; %Dephosphorylation of S6
    k9f2 = 3.3289; %Phosphorylation of S6
    p2U = 0.033; %Interstitial insulin rate of change
    q1 = 0.0031; %Interstitial glucose elimination rate
    q2 = 0.4054; %Glucose transfer rate from plasma to interstitium
    kfb = 1; %Positive feedback from mTORC1 reduced in T2DM condition
    
    %{
    
    Initial Values
    ---------------
    S(0) = 4 mmol; - Fasting stomach glucose
    L(0) = 14 mmol; - Fasting intestine glucose
    G(0) = 5 mM; - Fasting plasma glucose
    I(0) = 60 pM; - Fasting plasma insulin
    W(0) = 10 pM; - Fasting plasma incretin
    E(0) = 34 pM; - Fasting plasma glucagon
    C(0) = 3 mmol; - Fasting liver glucose
    M(0) = 2.5 mmol; - Fasting muscle glucose
    A(0) = 53.19 mmol; - Fasting intra-adipocitary glucose
    Y(0) = 0.4 nM; - Fasting plasma leptin
    Q(0) = 120 pM; - Fasting plasma ghrelin
    H(0) = 200 mmol; - Glucose intake
    I_A(0) = 20 pM; - Interstitial insulin
    S_A(0) = 135 mg/kg; - Interstitial glucose
    IR(0) = 92.9271; - Free insulin receptor
    IR_YP(0) = 0.0047; - Phosphorylated insulin receptor
    IRins(0) = 6.7692; - Insulin receptor bound
    IRi_YP(0) = 0.0433; - Phosphorylated and internalized insulin receptor
    IRi(0) = 0.2557; - Free internalized insulin receptor
    IRS1(0) = 70.8957; - Insulin receptor substrate 1
    IRS1_YP(0) = 0.0015; - Insulin receptor substrate 1 phosphorylated at
    tyrosine
    IRS1_YP_S307P(0) = 1.6060; - Insulin receptor subtrate 1 phosphorylated
    both at tyrosine and serine sites
    IRS1_S307P(0) = 27.4967; - Insulin receptor substrate 1 phosphorylated
    at serine site
    X(0) = 90.8250; - Inactive feedback protein
    X_P(0) = 9.1750; - Active feedback protein
    PKB(0) = 45.0895; - Protein kinase b
    PKB_T308P(0) = 10.9438; - PKB phosphorylated at threonine site
    PKB_S473P(0) = 29.6843; - PKB phosphorylated at serine site
    PKB_T308P_S473P = 14.2824; - PKB phosphorylated both at threonine and 
    at serine site
    
    mTORC1(0) = 48.0015; - Protein complex mTORC1
    mTORC1a(0) = 51.9985; - Active protein complex mTORC1
    mTORC2(0) = 99.6572; - Protein complex mTORC2
    mTORC2a(0) = 0.3428; - Active protein complex mTORC2
    AS160(0) = 56.5941; - Substrate of PKB
    AS160_T642P(0) = 43.4059; - Substrate of PKB phosphorylated form
    GLUT4m(0) = 49.1528; - Glucose transporter 4 in membrane
    GLUT4(0) = 50.8472; - Glucose transporter 4 in cytosol
    S6K(0) = 86.3744; - S6 kinase
    S6K_T389P(0) = 13.6256; - S6 kinase phosphorylated form
    S6(0) = 40.4757; - Ribosomal protein S6;
    S5_S235_S236P(0) = 59.5243; - Phosphorylated ribosomal protein S6
    %}
    
    
    % Define initial values for each equation
    y0 = [4.0000; 14.0000; 5.0000; 60.0000; 10.0000; 
         34.0000; 3.0000; 2.5000; 53.1900; 0.4000; 
         120.0000; 200.0000; 20.0000; 135.0000; 92.9271;
         0.0047; 6.7692; 0.0433; 0.2557; 70.8957;
         0.0015; 1.6060; 27.4967; 90.8250; 9.1750;
         45.0895; 10.9438; 29.6843; 14.2824; 48.0015;
         51.9985; 99.6572; 0.3428; 56.5941; 43.4059;
         49.1528; 50.8472; 86.3744; 13.6256; 40.4757;
         59.5243];
     
    %options=odeset('RelTol',1e-12,'AbsTol',1e-12);
    
    % Define time span in minutes
    tspan = [0 1000];
    
    % Solve ODEs using ode15s
    [t,y] = ode15s(@f, tspan, y0   ); %ode45 also works
     
    % Create figure
    figure1 = figure;
    
    % Create axes
    axes1 = axes('Parent',figure1);
    hold(axes1,'on');

    % Create multiple lines using matrix input to plot
    plot1 = plot(t,y,'Parent',axes1);
    set(plot1(1),'DisplayName','stomach glucose dynamics');
    set(plot1(2),'DisplayName','intestine glucose transit'); 
    set(plot1(3),'DisplayName','plasma glucose conc.');
    set(plot1(4),'DisplayName','plasma insulin conc.');
    set(plot1(5),'DisplayName','plasma incretin conc.');
    set(plot1(6),'DisplayName','plasma glucagon');
    set(plot1(7),'DisplayName','glucose mass in liver');
    set(plot1(8),'DisplayName','glucose mass in muscle tissue');
    set(plot1(9),'DisplayName','adipose tissue glucose mass');
    set(plot1(10),'DisplayName','plama leptin');
    set(plot1(11),'DisplayName','ghrelin conc. in plasma');
    set(plot1(12),'DisplayName','glucose intake');
    set(plot1(13),'DisplayName','interstitial insulin');
    set(plot1(14),'DisplayName','interstitial glucose');
    
    % Create ylabel
    ylabel('solution');

    % Create xlabel
    xlabel('time t');

    % Create title
    title('Big Simulation');
    
    box(axes1,'on');
    % Create legend
    legend(axes1,'show');
    legend1 = legend(axes1,'show');
    
    % Make subplots to graph solutions to diff eqs individually
    figure
    subplot(7,3,1)
    plot(t,y(:,1))
    xlabel('Time (min)')
    ylabel('S (mmol)')
    title('stomach glucose dynamics')
    
    subplot(7,3,2)
    plot(t,y(:,2))
    xlabel('Time (min)')
    ylabel('L (mmol)')
    title('intestinal glucose transit')
    
    subplot(7,3,3)
    plot(t,y(:,3))
    xlabel('Time (min)')
    ylabel('G (mM)')
    title('plasma glucose')
    
    subplot(7,3,4)
    plot(t,y(:,4))
    xlabel('Time (min)')
    ylabel('I (pM)')
    title('plasma insulin')
    
    subplot(7,3,5)
    plot(t,y(:,5))
    xlabel('Time (min)')
    ylabel('W (pM)')
    title('plasma incretin')
    
    subplot(7,3,6)
    plot(t,y(:,6))
    xlabel('Time (min)')
    ylabel('E (pM)')
    title('plasma glucagon')
    
    subplot(7,3,7)
    plot(t,y(:,7))
    xlabel('Time (min)')
    ylabel('C (mmol)')
    title('glucose mass in liver')
    
    subplot(7,3,8)
    plot(t,y(:,8))
    xlabel('Time (min)')
    ylabel('M (mmol)')
    title('glucose mass in muscle tissue')
    
    subplot(7,3,9)
    plot(t,y(:,9))
    xlabel('Time (min)')
    ylabel('A (mmol)')
    title('adipose tissue glucose mass')
    
    subplot(7,3,10)
    plot(t,y(:,10))
    xlabel('Time (min)')
    ylabel('Y (nM)')
    title('plasma leptin')
    
    subplot(7,3,11)
    plot(t,y(:,11))
    xlabel('Time (min)')
    ylabel('Q (pM)')
    title('plasma ghrelin')
    
    subplot(7,3,12)
    plot(t,y(:,12))
    xlabel('Time (min)')
    ylabel('H (mmol)')
    title('glucose intake')
    
    subplot(7,3,13)
    plot(t,y(:,13))
    xlabel('Time (min)')
    ylabel('INS [pM]')
    title('interstitial insulin')
    
    subplot(7,3,14)
    plot(t,y(:,14))
    xlabel('Time (min)')
    ylabel('Gt [mg/kg]')
    title('interstitial glucose')
    
    subplot(7,3,[19,21])
    plot(t,y)
    xlabel('Time (min)')
    ylabel('conc')
    title('Glucose simulation')
    
    % ------------------------------------------------------------------------------------
    function dydt = f(~,y)
        Ec = (c1/(c2 + y(4)*e))*(Ge - y(3))*heaviside(Ge - y(3));
        dydt = zeros(42,1);
        dydt = [ % (1) stomach glucose dynamics (S)
                 b9*y(12) - b8*y(1)
                 
                 % (2) intestinal glucose transit (L)
                 b8*y(1) - b10*y(2)
                 
                 %(3) dynamics of plasma glucose concentration (G)
                 f1*((b10*y(2))/v) + f1*((b5*y(7))/v) - b1*y(3) - b3*y(4)*y(3)
                 
                 % (4) dynamics of plasma insulin concentration (I)
                 b4*y(3) + c*y(5)*y(3) - b2*y(4)
                 
                 % (5) variation of plasma incretin concentration (W)
                 b6*y(2) - b7*y(5) + s
                 
                 % (6) dynamics of plasma glucagon (E)
                 c0 + Ec - c3*y(6)
                 
                 % (7) glucose mass in the liver ready to be secreted,
                 b23 - b25*y(4)*y(6) - b22*y(3) + b21*y(6) - b5*y(7)
                 
                 % (8) dynamics of glucose mass in muscle tissue (M)
                 0.1*(v/f1)*b3*y(3)*y(4) - b27*y(8)
                 
                 % (9) adipose tissue glucose mass (A)
                 % k8 * GLUT4m(t) * (GtA(t)/(KmG4 + GtA(t))) + GLUT1 *
                 % (GtA(t)/(KmG1 + GtA(t)) - k_gluc * A(t)
                 k8 * y(36) * (y(14)/(KmG4 + y(14))) + GLUT1 * (y(14)/(KmG1 + y(14))) - k_gluc * y(9)
                 
                 % (10) dynamics of plasma leptin (Y)
                 b13*y(9)*Fat - b14*y(10)
                 
                 % (11) dynamics of ghrelin concentration in plasma (Q)
                 b12*exp(-l*y(1))*exp(-m*y(4))-b11*y(11)
                 
                 % (12) glucose intake (H)
                 (b17*y(11))/(b18*y(10) + 1)*exp(-r*y(4)) - b19*y(3)*y(12) - b9*y(12)
             
                 % (13) interstitial insulin (INS_A)
                 -p2U*y(13) + p2U*(y(4)-Ib) 
                 
                 % (14) interstital glucose (GtA)
                 -q1*y(14) + q2*(y(3)-Gb)
                 
                 %--------------------------------------------------------
                 
                 % (15) dynamics of the free insulin receptor (IR) on the 
                 % adipocyte membrane
                 %-k1a * IR(t) * INS_A(t) - k1basal * IR(t) + k1g *
                 %IR_YP(t) + k1r * IRi(t)
                 -k1a * y(15) * y(13) - k1basal * y(15) + k1g * y(16) + k1r * y(19)
                 
                 % (16) dynamics of the phosphorylated insulin receptor
                 % (IR_YP)
                 % k1basal * IR(t) + k1c * IRins(t) - k1d * IR_YP(t) - k1g
                 % * IR_YP(t)
                 k1basal * y(15) + k1c * y(17) - k1d * y(16) - k1g * y(16)
                 
                 % (17) dynamics of the insulin receptor that is bound to
                 % insulin but not already phosphorylated (IRins)
                 % k1a * IR(t) * INS_A(t) - k1c * IRins(t)
                 k1a * y(15) * y(13) - k1c * y(17)
                 
                 % (18) phosphorylated insulin receptor that has been
                 % endocytosed from the adipocyte (IRi_YP)
                 % k1d * IR_YP(t) - k1f * IRi_YP(t) * X_P(t)
                 k1d * y(16) - k1f * y(18) * y(25)
                 
                 % (19) dynamics of the free internalized insulin receptor
                 % (IRi)
                 % k1f * IRi_YP(t) * X_P(t) - k1r * IRi(t)
                 k1f * y(18) * y(25) - k1r * y(19)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 20-23 describe the insulin receptor substrate 1
                 % (IRS1) in its four phosphorylation forms
                 
                 % (20) IRS1 is not phosphorylated
                 % k2b * IRS1_YP(t) + k2g * IRS1_S307P(t) - k2a * IRS1(t) *
                 % IR_YP(t) - k2basal * IRS1(t)
                 k2b * y(21) + k2g * y(23) - k2a * y(20) * y(16) - k2basal * y(20)
                 
                 % (21) IRS1_YP is phosphorylated
                 % k2a * IRS1(t) * IRi_YP(t) + k2d * IRS1_YP_S307P(t) - k2b
                 % * IRS1_YP(t) - k2c * IRS1_YP(t) * mTORC1a(t) * kfb
                 k2a * y(20) * y(18) + k2d * y(22) - k2b * y(21) - k2c * y(21) * y(31) * kfb
                 
                 % (22) IRS1_YP_S307P is phosphorylated
                 % k2c * IRS1_YP(t) * mTORC1a(t) * kfb - k2d *
                 % IRS1_YP_S307P(t) - k2f * IRS1_YP_S307P(t)
                 k2c * y(21) * y(31) * kfb - k2d * y(22) - k2f * y(22)
                 
                 % (23) IRS1_S307P is phosphorylated only at the serine
                 % site
                 % k2basal * IRS1(t) + k2f * IRS1_YP_S307P(t) -
                 % k2g*IRS1_S307P(t)
                 k2basal * y(20) + k2f * y(22) - k2g * y(23)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 24-25 represent the dynamics of the feedback
                 % protein X that, in its active form X_P, enhances the
                 % dephsophorylation of the internalized insulin receptor
                 
                 % (24) X
                 % k3b * X_P(t) - k3a * X(t) * IRS1_YP(t)
                 k3b * y(25) - k3a * y(24) * y(21)
                 
                 % (25) X_P
                 % k3a * X(t) * IRS1_YP(t) - k3b * X_P(t)
                 k3a * y(24) * y(21) - k3b * y(25)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 26-29 describe the four different forms of the
                 % protein kinase b:
                 
                 % (26) PKB: not phosphorylated
                 % k4b * PKB_T308P(t) + k4h * PKB_S473P(t) - k4a * PKB(t) *
                 % IRS1_YP(t)
                 k4b * y(27) + k4h * y(28) - k4a * y(26) * y(21)
                 
                 % (27) PKB_T308P: phosphorylated only at the threonine
                 % site
                 % k4a * PKB(t) * IRS1_YP(t) - k4b * PKB_T308P(t) - k4c *
                 % PKB_T308P(t) * mTORC2a(t)
                 k4a * y(26) * y(21) - k4b * y(27) - k4c * y(27) * y(33)
                 
                 % (28) PKB_S473P: phosphorylated only at the serine site
                 % k4f * PKB_T308P_S473P(t) - k4e * PKB_S473P(t) *
                 % IRS1_YP_S307P(t) - k4h * PKB_S473P(t)
                 k4f * y(28) - k4e * y(28) * y(22) - k4h * y(28)                 
                 
                 % (29) PKB_T308P_S473P: phosphorylated at both sites
                 % k4c * PKB_T308P(t) * mTORC2a(t) + k4c * PKB_S473P(t) *
                 % IRS1_YP_S307P(t) - k4f * PKB_T308P_S473P(t)
                 k4c * y(27) * y(33) + k4c * y(28) * y(22) - k4f * y(29)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 30-31 describe the protein complex mTORC1 in its
                 % inactive (mTORC1) and active (mTORC1a) forms:
                 
                 % (30) mTORC1: inactive form
                 % k5b * mTORC1a(t) - mTORC1(t) * (k5a1 *
                 % PKB_T308P_S473P(t) + k5a2 * PKB_T308P)
                 k5b * y(31) - y(30) * (k5a1 * y(29) + k5a2 * y(27))
                 
                 % (31) mTORC1a: active form
                 % mTORC1(t) * (k5a1 * PKB_T308P_S473P(t) + k5a2 *
                 % PKB_T308P(t)) - k5b * mTORC1a(t)
                 y(30) * (k5a1 * y(29) + k5a2 * y(27)) - k5b * y(31)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 32-33 represent the protein complex mTORC2 in its
                 % inactive (mTORC2) and active (mTORC2a) forms:
                 
                 % (32) mTORC2: inactive
                 % -k5c * mTORC2(t) * IRi_YP(t) + k5d * mTORC2a(t)
                 -k5c * y(32) * y(18) + k5d * y(33)
                 
                 % (33) mTORC2a: active
                 % k5c * mTORC2(t) * IRi_YP(t) - k5d * mTORC2a(t)
                 k5c * y(32) * y(18) - k5d * y(33)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 34-35 describe AS160, the substrate of PKB, and its
                 % phosphorylated form AS160_T642P:
                 
                 % (34) AS160
                 % k6b * AS160_T642P(t) - AS160(t)(k6a1 *
                 % PKB_T308P_S473P(t) + k6a2 * PKB_S473P(t))
                 k6b * y(35) - y(34) * (k6a1 * y(29) + k6a2 * y(28))
                 
                 % (35) AS160_T642P
                 % k6b * AS160_T642P(t) - AS160(t) * (k6a1 *
                 % PKB_T308P_S473P(t) + k6a2 * PKB_S473P(t))
                 k6b * y(35) - y(34) * (k6a1 * y(29) + k6a2 * y(28))
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 36-37 represent glucose transporter 4 inside the
                 % adipocyte cytosol (GLUT4) and on the cell membrane
                 % (GLUT4m)
                 
                 % (36) GLUT4m
                 % k7a * GLUT4(t) * AS160_T642P(t) - k7b * GLUT4m(t)
                 k7a * y(37) * y(35) - k7b * y(36)
                 
                 % (37) GLUT4
                 % -k7a * GLUT4(t) * AS160_T642P(t) + k7b * GLUT4m(t)
                 -k7a * y(37) * y(35) + k7b * y(36)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 38-39 describe the dynamics of the S6 kinase (S6K)
                 % and its phosphorylated form S6K_T389P
                 
                 % (38) S6K
                 % k9b * S6K_T389P(t) - k9a * S6K(t) * mTORC1a(t)
                 k9b * y(39) - k9a * y(38) * y(31)
                 
                 % (39) S6K_T389P
                 % k9a * S6K(t) * mTORC1a(t) - k9b * S6K_T389(t)
                 k9a * y(38) * y(31) - k9b * y(39)
                 
                 %--------------------------------------------------------
                 
                 % Eqs. 40-41 represent the ribosomal protein S6 and its
                 % phosphorylated form S6_S235_S236P
                 
                 % (40) S6
                 % k9b2 * S6_S235_S236P(t) - k9f2 * S6(t) * S6K_T389P(t)
                 k9b2 * y(41) - k9f2 * y(40) * y(39)
                 
                 % (41) S6_S235_S236P
                 % k9f2 * S6(t) * S6K_T389P(t) - k9b2 * S6_S235_S236P(t)
                 k9f2 * y(40) * y(39) - k9b2 * y(41) ];
             
                 %--------------------------------------------------------
    end % End nested function f
    % ------------------------------------------------------------------------------------
end
