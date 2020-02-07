Fs=20000;
x=1;
record=audiorecorder(Fs,16,1);
while x==1
    x=isempty(input('Appuyer sur Entrée pour commencer, ou 0 pour quitter: '));
    mi_aigu=1318.505;
    si=987.7669;
    sol=783.9911;
    re=587.3279;
    la=440;
    mi_grave=329.627;
    guitar=[mi_aigu,si,sol,re,la,mi_grave];
    if x==1
        p=input('Quelle corde? 1=mi_aigu 2=si 3=sol 4=re 5=la 6=mi_grave: ');
        w=guitar(p);
        facteur= length(record);
        y=isempty(input('Appuyer sur Entrée pour enregistrer ou 0 pour quitter: '));
        while y==1
            Fs=20000;
            disp('Début')
            recordblocking(record,5);
            disp('Fin')
            play(record)
            data=getaudiodata(record);
            k=2;
            I=data(1:k:end);
            soundsc(I,Fs);
            J=abs(fft(data));
            subplot(2,1,1)
            plot(I)
            subplot(2,1,2)
            plot(J)
            if p==6
                i=max(J);
                mi_grave_bis=i;
                disp(['La fréquence réelle est '  num2str(mi_grave_bis)  ' il faut ajuster à ' num2str(w)])
                x=2;y=2;
            elseif p==5
                i=max(J);
                la_bis=i;
                disp(['La fréquence réelle est '  num2str(la_bis)  ' il faut ajuster à ' num2str(w)])
                x=2;y=2;
            elseif p==4
                i=max(J);
                re_bis=i;
                 disp(['La fréquence réelle est '  num2str(re_bis)  'il faut ajuster à ' num2str(w)])
                 x=2;y=2;
            elseif p==3
                i=max(J);
                sol_bis=i;
                disp(['La fréquence réelle est '  num2str(sol_bis)  ' il faut ajuster à ' num2str(w)])
                x=2;y=2;
            elseif p==2
                i=max(J);
                si_bis=i;
                disp(['La fréquence réelle est '  num2str(si_bis)  ' il faut ajuster à ' num2str(w)])
                x=2;y=2;
            elseif p==1
                i=max(J);
                mi_aigu_bis=i;
                disp(['La fréquence réelle est '  num2str(mi_aigu_bis)  ' il faut ajuster à ' num2str(w)])
                x=2;y=2;
            end
        end
    end
end
 

               
            

            

