function totalmoney=manycaller(dirt,fmt)
    %z is number of image
    %input is a cell each containing note information
    kk=zeros(7,1); %%kk will be sum of each note number
    totalmoney=0;
    A=dir(fullfile(dirt,strcat('*.',fmt)));
    [~,B]=sort({A.date});
    fileNames = { A.name };
    C=fileNames(B);
    for iFile = 1 : length(A)
        newName = fullfile(dirt, sprintf( strcat('%0d.',fmt), iFile ) );
        movefile( fullfile(dirt, C{ iFile }), newName );
        x=sprintf( strcat('%0d.',fmt), iFile);
        fprintf('\nIMAGE "%s"',C{ iFile });
        imagename=sprintf(C{ iFile });
        figure;
        [k,totcount]=moneycounter2(x,imagename);
        kk=k+kk;
        totalmoney=totalmoney+totcount;
        newName = fullfile(dirt, C{iFile});
        y=sprintf( strcat('%0d.',fmt), iFile );
        movefile( fullfile(dirt, y), newName );
    end
    fprintf('\n\nTotal Number of Each Note in all the Images:\n2000 rupees: %2.0f \n500 rupees: %2.0f\n200 rupees: %2.0f \n100 rupees: %2.0f \n50 rupees: %2.0f \n20 rupees: %2.0f \n10 rupees: %2.0f\n',kk)
    fprintf('TOTAL AMOUNT = %.1d\n',totalmoney)
    
    
end