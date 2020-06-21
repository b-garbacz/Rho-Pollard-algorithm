︠a34f3a1d-ec14-47a2-a0e2-38a39d318614︠
import time

def fast_power(a, b, N):
    t = 1
    while(b > 0):
        if(b % 2 == 1):
            t = t * a % N
        a = a * a % N
        b = (b // 2)
    return t % N

def fact_pollard(n):
    x_0=2        #basic values (might be random)
    y_0=2
    a=1
    fun = lambda x_0: ((x_0**2) + a) % n  #creating polynomial (x_0)^2 + 1 (mod n)
    d=1
    while (d == 1): #superposition for f (x_0) and f (f (y_0))
        x_0 = fun(x_0)

        y_0 = fun( fun(y_0) )

        d =  gcd( abs(x_0 - y_0) , n ) #Do it while until  |x_0 -y_0| it is relatively prime with n
    if 1<d<n: return [d,n/d]




def fact_pollard_2(n, y):
    x_0=2         #basic values (might be random)
    y_0=2
    a=1
    while(y > 0):
        fun = lambda x_0: ((x_0**2) + a) % n #creating polynomial (x_0)^2 + 1 (mod n)
        d=1
        while (d == 1):   #superposition for f (x_0) and f (f (y_0))
            x_0 = fun(x_0)

            y_0 = fun( fun(y_0) )

            d =  gcd( abs(x_0 - y_0) , n ) #Do it while until  |x_0 -y_0| it is relatively prime with n
        if 1<d<n:
            return [d,n/d]
        y = y - 1       #If  dividers of n cannot be found, generate new values for a,x_0 and y_0. No more than y times
        a = randint(1, n)
        x_0 = randint(2, n)
        y_0 = randint(2, n)

print("*************zad2*************")
start = time.time()
print(fact_pollard(66511))
print time.time() - start
print("*************zad1*************")
start = time.time()
print(fast_power(7, 10, 15))
print time.time() - start
print("*************zad3*************")
start = time.time()
print(fact_pollard_2(66511,3))
print time.time() - start









