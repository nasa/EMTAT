function controller = iDesign_SpeedController(Js,bs,tau,StepAmp)

    % Motor (Mechanical only)
    A = [0 1; 0 -bs/Js];
    B = [0; 1/Js];
    C = [0 1]; 
    D = 0;
    motor = ss(A,B,C,D);
    
    % Crossover frequency
    Wc = 2*pi/tau;
    
    % Tune PID controller based on motor model
    opt = pidtuneOptions('DesignFocus','balanced');
    controller = pidtune(motor,'PID',Wc,opt);
    
    % Create closed loop state space
    closedloop = feedback(motor*controller,1);
    
    %Simulate step response of closed loop
    OPTIONS = stepDataOptions('StepAmplitude',StepAmp);
    T1 = [0:tau*.1:tau*10]; %s
    [Y,T] = step(closedloop,T1,OPTIONS);
    
    % Normalize closed loop response
    normalize = Y./StepAmp;
    
    % Plot normalized response
    figure(1)
    clf
    hold on
    plot(T,ones(length(T),1),'--k');
    plot(T,normalize);
    hold off
    xlabel('Time, s');
    ylabel('Normalized Response');
    legend('Setpoint','Motor');
    title('iDesign: Speed Control Response')
    grid on
    
end