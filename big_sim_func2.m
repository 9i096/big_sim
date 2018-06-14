function big_sim_func2()

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
    %GLUT1 = 
    Ib = 60.0; %Fasting plasma insulin (Basal level; pM)
    %k8 = 
    %KmG1 = 
    %KmG4 = 
    %k_gluc =
    l = 0.006; %Glucose in stomach dependent decay rate of ghrelin (mmol^-1)
    m = 0.04; %Insulin dependent decay rate of ghrelin (pM^-1)
    p2U = 0.033; %Interstitial insulin rate of change (min^-1)
    q1 = 0.0031; %Interstitial glucose elimination rate (min^-1)
    q2 = 0.4054; %Glucose transger rate from plasma to interstitium ((mg/kg)/mM.min)
    r = 0.04; %Insulin depdent decay rate of glucose intake (pM^-1)
    s = 0.03; %Incretin constant secretion (pM/min)
    v = 15; %glucose distribution volume (liters)
    
    y0 = [4.0; 14.0; 5.0; 60.0; 10.0; 34.0; 3.0; 2.5; 53.19; 0.4; 120; 200; 20; 135];
    tspan = [0 1000];
    
    [t,y] = ode15s(@f,tspan,y0); %ode45 also works
     
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
    %set(legend1,...
        %'Position',[0.918685121107267 0.626582278481012 0.141868512110727 0.298523206751055]);
    
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
        dydt = zeros(13,1);
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
                 % Finish this equation and add additional GLUTM equations
                 % as needed
                 -0.1*y(9)
                 
                 % (10) dynamics of plasma leptin (Y)
                 b13*y(9)*Fat - b14*y(10)
                 
                 % (11) dynamics of ghrelin concentration in plasma (Q)
                 b12*exp(-l*y(1))*exp(-m*y(4))-b11*y(11)
                 
                 % (12) glucose intake (H)
                 (b17*y(11))/(b18*y(10) + 1)*exp(-r*y(4)) - b19*y(3)*y(12) - b9*y(12)
             
                 % (13) interstitial insulin (INS_A)
                 -p2U*y(13) + p2U*(y(4)-Ib) 
                 
                 % (14) interstital glucose (GtA)
                 -q1*y(14) + q2*(y(3)-Gb) ];
    end % End nested function f
    % ------------------------------------------------------------------------------------
end