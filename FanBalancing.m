clear; clc;

perfect_radius = 15;
required_radius = 2;
required_mass = 0;
perfect_mass = 2;

for i = -10:10;
    for j = -10:10
        for k = -10:10
            for l= -5:5
                for m = -5:5
                    for n = -5:5
                        r1 = perfect_radius*(1+(i/100));
                        r2 = perfect_radius*(1+(j/100));
                        r3 = perfect_radius*(1+(k/100));
                        m1 = perfect_mass*(1+(l/100));
                        m2 = perfect_mass*(1+(m/100));
                        m3 = perfect_mass*(1+(n/100));
                        thetta1  = 0 + pi*i/100/180;
                        thetta2 = 2/3*pi + pi*j/100/180;
                        thetta3 = 4/3*pi + pi*k/100/180;
                        mrc = -(m1*r1*cos(thetta1) + m2*r2*cos(thetta2) + m3*r3*cos(thetta3));
                        mrs = -(m1*r1*sin(thetta1) + m2*r2*sin(thetta2) + m3*r3*sin(thetta3));
                        if (mrs>0 && mrc>0)
                            thetta = atan(mrs/mrc);
                        elseif (mrs>0 && mrc<0)
                            thetta = pi - atan(mrs/abs(mrc));
                        elseif (mrs<0 && mrc>0)
                            thetta = 2*pi - atan(abs(mrs)/mrc);
                        else
                            thetta = pi + atan(mrs/mrc);
                        end
                        tm = mrc/required_radius/cos(thetta);
                        if (tm > required_mass)
                            required_mass = tm;
                            required_thetta = thetta;
                            I=i;
                            J=j;
                            K=k;
                            L=l;
                            M=m;
                            N=n;
                        end
                    end
                end
            end
        end
    end
end
required_thetta = required_thetta*180/pi;
display(required_mass); 
display(required_thetta);