classdef HW2
    %This provides the code for HW2
    
    properties
        
    end
    
    methods
        
        function T = trotz(~, theta)
            T = zeros(4,4);
            for i=1:4
                T(i,i) = 1;                
            end
            T(1,1) = cos(theta);
            T(1,2) = sin(theta);
            T(2,1) = -sin(theta);
            T(2,2) = cos(theta);
        end
        
        function T = troty(~,theta)
            T = zeros(4,4);
            for i=1:4
                T(i,i) = 1;                
            end
            T(1,1) = cos(theta);
            T(1,3) = sin(theta);
            T(3,1) = -sin(theta);
            T(3,3) = cos(theta);
        end
        
        function T = trotx(~, theta)
            T = zeros(4,4);
            for i=1:4
                T(i,i) = 1;                
            end
            T(2,2) = cos(theta);
            T(2,3) = sin(theta);
            T(3,2) = -sin(theta);
            T(3,3) = cos(theta);
        end
        
        %where is 1, 2 or 3 (x, y or z respectivly). 
        %val is how much we are translating it.
        function T = translate(~, where, val)
            T = zeros(4,4);
            for i=1:4
                T(i,i) = 1;                
            end
            T(4,where) = val;
        end
        
        function T = tdh(self, theta, d, a, alpha)
            T = self.trotz(theta) * sefl.translate(3, d) * self.translate(1,a) * self.trotx(alpha);         
        end
        
        function T = fwkinscara(~, q)
            L1 = .5;
            L2 = .5;
            L4 = .5;
            
            R1 = tdh(q(1), 0, L1, 0);
            R2 = tdh(q(2),0, L2, 0); 
            R3 = tdh(0, -q(3), 0, 0);
            R4 = tdh(q(4), L4, 0, 0);
            
            T = R1 * R2 * R3 * R4;
            
        end
        
        function T = fwkinrpp(q)
            
        end
        
        
        
        
       
    end
end

