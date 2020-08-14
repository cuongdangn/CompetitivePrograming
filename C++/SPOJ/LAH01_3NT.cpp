#include <stdio.h>
#include <math.h>
int main(int argc, char **argv)
{
    freopen("code.in","r",stdin);
    freopen("code.ou","w",stdout);
	int chai;
	while(scanf("%d",&chai)!=EOF){

	int sum = chai;
	chai = chai + 2;
	int vo = chai;
	for(int i = 0; ; ++i){
		chai = vo / 3;
		sum += chai;
		vo = chai + vo%3;
		if(vo <= 2) break;}
	if(vo == 2) printf("%d\n", sum);
	else printf("%d\n", sum -1);}
	return 0;
}
