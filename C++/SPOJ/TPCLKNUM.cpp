#include <iostream>

const int nmax=100001,base=1000000007;
int f[nmax],g[nmax],n,k;

int main()
{
	std::cin>>n>>k;
	g[1]=9;
	for (int i=2;i<=n;i++) g[i]=((long long)g[i-1]*10)%base;
	f[k]=1;
	f[k+1]=f[k]*10+f[k]*8;
	for (int i=k+2;i<=n;i++) f[i]=((long long)f[i-1]*10+((long long)g[i-k-1]-f[i-k-1]+base)*9)%base;
	std::cout<<f[n];
}
