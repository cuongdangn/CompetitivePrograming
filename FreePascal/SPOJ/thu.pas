#include <cstring>
#include <ctype.h>
#include <bitset>
#include <assert.h>

using namespace std;

#define MAX 1030
struct Fenwick2D {
    int T[MAX][MAX];
	int n,m;
ÿÿÿÿvoidÿclear(intÿn,ÿintÿm)ÿ{
ÿÿÿÿÿÿÿÿfor(intÿi=1;ÿi<=n;ÿi++)
ÿÿÿÿÿÿÿÿÿÿÿÿfor(intÿj=1;ÿj<=m;ÿj++)
ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿT[i][j]ÿ=ÿ0;
ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ÿÿÿÿÿÿÿÿthis->nÿ=ÿn;
ÿÿÿÿÿÿÿÿthis->mÿ=ÿm;
ÿÿÿÿ}
ÿÿÿÿÿ
ÿÿÿÿvoidÿadjust(intÿx,ÿintÿy,ÿintÿv)ÿ{
ÿÿÿÿÿÿÿÿforÿ(intÿi=x;ÿiÿ<=ÿn;ÿiÿ+=ÿ(i&-i))ÿ
ÿÿÿÿÿÿÿÿÿÿÿÿfor(intÿj=y;ÿjÿ<=ÿm;ÿjÿ+=ÿ(j&-j))
ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿT[i][j]ÿ+=ÿv;ÿ
ÿÿÿÿ}
ÿÿÿÿÿ
ÿÿÿÿintÿrsq(intÿx,ÿintÿy)ÿ{ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ÿÿÿÿÿÿÿÿintÿsumÿ=ÿ0;ÿ
ÿÿÿÿÿÿÿÿfor(intÿi=x;ÿi;ÿiÿ-=ÿ(i&-i))
ÿÿÿÿÿÿÿÿÿÿÿÿfor(intÿj=y;ÿj;ÿjÿ-=ÿ(j&-j))
ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿsumÿ+=ÿT[i][j];
ÿÿÿÿÿÿÿÿreturnÿsum;ÿ
ÿÿÿÿ}
ÿ
ÿÿÿÿintÿrsq(intÿx1,ÿintÿy1,ÿintÿx2,ÿintÿy2)ÿ{ÿÿÿÿÿÿÿÿÿÿÿÿÿreturnÿrsq(x2,ÿy2)ÿ-ÿrsq(x2,ÿy1-1)ÿ-ÿrsq(x1-1,ÿy2)ÿ+ÿrsq(x1-1,ÿy1-1);ÿ
ÿÿÿÿ}
};
ÿ
Fenwick2DÿT;
ÿ
intÿmain()ÿ{
ÿÿÿÿintÿcmd;
ÿÿÿÿwhile(cinÿ>>ÿcmd,ÿcmdÿ!=ÿ3)ÿ{
ÿÿÿÿÿÿÿÿifÿ(cmdÿ==ÿ0)ÿ{
ÿÿÿÿÿÿÿÿÿÿÿÿintÿs;ÿ
ÿÿÿÿÿÿÿÿÿÿÿÿcinÿ>>ÿs;
ÿÿÿÿÿÿÿÿÿÿÿÿT.clear(s,ÿs);
ÿÿÿÿÿÿÿÿ}ÿelseÿifÿ(cmdÿ==ÿ1)ÿ{
ÿÿÿÿÿÿÿÿÿÿÿÿintÿx,ÿy,ÿa;
ÿÿÿÿÿÿÿÿÿÿÿÿcinÿ>>ÿxÿ>>ÿyÿ>>ÿa;
ÿÿÿÿÿÿÿÿÿÿÿÿx++;ÿy++;
ÿÿÿÿÿÿÿÿÿÿÿÿT.adjust(x,ÿy,ÿa);
ÿÿÿÿÿÿÿÿ}ÿelseÿifÿ(cmdÿ==ÿ2)ÿ{
ÿÿÿÿÿÿÿÿÿÿÿÿintÿx1,ÿy1,ÿx2,ÿy2;
ÿÿÿÿÿÿÿÿÿÿÿÿcinÿ>>ÿx1ÿ>>ÿy1ÿ>>ÿx2ÿ>>ÿy2;
ÿÿÿÿÿÿÿÿÿÿÿÿx1++;ÿy1++;ÿx2++;ÿy2++;
ÿÿÿÿÿÿÿÿÿÿÿÿcoutÿ<<ÿT.rsq(x1,ÿy1,ÿx2,ÿy2)ÿ<<ÿendl;
ÿÿÿÿÿÿÿÿ}
ÿÿÿÿ}
}
