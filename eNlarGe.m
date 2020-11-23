function [bittosend_final]= eNlarGe(bbbb,N)
        bittosend_final=[];
        for index=1:length(bbbb)
            if bbbb(index)
                bittosend_final=[bittosend_final ones(1,N)];
            else
                bittosend_final=[bittosend_final zeros(1,N)];
            end
        end   
  end