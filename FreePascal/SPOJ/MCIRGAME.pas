type    bignum = string;
const   fi='';
        fo='';
var
        f,g     :       text;
        n       :       byte;
        i       :       byte;
        s       :       array[0..150] of string;
{function        add(a,b: ansistring):ansistring;
var     sum,carry,i,x,y :       longint;
        c       :       ansistring;
begin
        carry:=0;c:='';
        while length(a) < length(b) do a:= '0' +a;
        while length(b) < length(a) do b:= '0' +b;
        for i:=length(a) downto 1 do
                begin
                        x:= ord(a[i]) -ord('0');
                        y:= ord(b[i])- ord('0');
                        sum:=  x+y+carry;
                        carry:= sum div 10;
                        c:= chr(sum mod 10 +48) +c;
                end;
        if carry > 0 then c:='1' +c;
        add:=c;
end;
function        nhan(a:bignum;b:longint):bignum;
var     c,tg      :       bignum;
        carry,s2,j :       longint;
begin
        c:='';
        carry:=0;
        for j:=length(a) downto 1 do
          begin
                s2:=(ord(a[j])-48)*b+carry;
                carry:=s2 div 10;
                c:=chr(s2 mod 10 +48)+c;
          end;
        if carry>0 then str(carry,tg) else tg:='';
        exit(tg+c);
end;
function        nhan1(a,b:bignum):bignum;
var     sum,tmp:bignum;
        m,i,j:integer;
begin
        m:=-1;sum:='';
        for i:=length(a) downto 1 do
                begin
                m:=m+1;
                tmp:=nhan(b,ord(a[i])-48);
                for j:=1 to m do tmp:=tmp+'0';
                sum:=add(tmp,sum);
                end;
        exit(sum);
end;}


procedure       xuli;
var     j : longint;
begin
        s[0]:='1';
        s[1]:='1';
        s[2]:='2';
        s[3]:='5';
        s[4]:='14';
        s[5]:='42';
        s[6]:='132';
        s[7]:='429';
        s[8]:='1430';
        s[9]:='4862';
        s[10]:='16796';
        s[11]:='58786';
        s[12]:='208012';
        s[13]:='742900';
        s[14]:='2674440';
        s[15]:='9694845';
        s[16]:='35357670';
        s[17]:='129644790';
        s[18]:='477638700';
        s[19]:='1767263190';
        s[20]:='6564120420';
        s[21]:='24466267020';
        s[22]:='91482563640';
        s[23]:='343059613650';
        s[24]:='1289904147324';
        s[25]:='4861946401452';
        s[26]:='18367353072152';
        s[27]:='69533550916004';
        s[28]:='263747951750360';
        s[29]:='1002242216651368';
        s[30]:='3814986502092304';
s[31]:='14544636039226909';
s[32]:='55534064877048198';
s[33]:='212336130412243110';
s[34]:='812944042149730764';
s[35]:='3116285494907301262';
s[36]:='11959798385860453492';
s[37]:='45950804324621742364';
s[38]:='176733862787006701400';
s[39]:='680425371729975800390';
s[40]:='2622127042276492108820';
s[41]:='10113918591637898134020';
s[42]:='39044429911904443959240';
s[43]:='150853479205085351660700';
s[44]:='583300119592996693088040';
s[45]:='2257117854077248073253720';
s[46]:='8740328711533173390046320';
s[47]:='33868773757191046886429490';
s[48]:='131327898242169365477991900';
s[49]:='509552245179617138054608572';
s[50]:='1978261657756160653623774456';
s[51]:='7684785670514316385230816156';
s[52]:='29869166945772625950142417512';
s[53]:='116157871455782434250553845880';
s[54]:='451959718027953471447609509424';
s[55]:='1759414616608818870992479875972';
s[56]:='6852456927844873497549658464312';
s[57]:='26700952856774851904245220912664';
s[58]:='104088460289122304033498318812080';
s[59]:='405944995127576985730643443367112';
s[60]:='1583850964596120042686772779038896';
s[61]:='6182127958584855650487080847216336';
s[62]:='24139737743045626825711458546273312';
s[63]:='94295850558771979787935384946380125';
s[64]:='368479169875816659479009042713546950';
s[65]:='1440418573150919668872489894243865350';
s[66]:='5632681584560312734993915705849145100';
s[67]:='22033725021956517463358552614056949950';
s[68]:='86218923998960285726185640663701108500';
s[69]:='337485502510215975556783793455058624700';
s[70]:='1321422108420282270489942177190229544600';
s[71]:='5175569924646105559418940193995065716350';
s[72]:='20276890389709399862928998568254641025700';
s[73]:='79463489365077377841208237632349268884500';
s[74]:='311496878311103321137536291518809134027240';
s[75]:='1221395654430378811828760722007962130791020';
s[76]:='4790408930363303911328386208394864461024520';
s[77]:='18793142726809884575211361279087545193250040';
s[78]:='73745243611532458459690151854647329239335600';
s[79]:='289450081175264899454283846029490767264392230';
s[80]:='1136359577947336271931632877004667456667613940';
s[81]:='4462290049988320482463241297506133183499654740';
s[82]:='17526585015616776834735140517915655636396234280';
s[83]:='68854441132780194707888052034668647142985206100';
s[84]:='270557451039395118028642463289168566420671280440';
s[85]:='1063353702922273835973036658043476458723103404520';
s[86]:='4180080073556524734514695828170907458428751314320';
s[87]:='16435314834665426797069144960762886143367590394940';
s[88]:='64633260585762914370496637486146181462681535261000';
s[89]:='254224158304000796523953440778841647086547372026600';
s[90]:='1000134600800354781929399250536541864362461089950800';
s[91]:='3935312233584004685417853572763349509774031680023800';
s[92]:='15487357822491889407128326963778343232013931127835600';
s[93]:='60960876535340415751462563580829648891969728907438000';
s[94]:='239993345518077005168915776623476723006280827488229600';
s[95]:='944973797977428207852605870454939596837230758234904050';
s[96]:='3721443204405954385563870541379246659709506697378694300';
s[97]:='14657929356129575437016877846657032761712954950899755100';
s[98]:='57743358069601357782187700608042856334020731624756611000';
s[99]:='227508830794229349661819540395688853956041682601541047340';
s[100]:='896519947090131496687170070074100632420837521538745909320';
s[101]:='3533343320884635898708258511468514257188006702535057407320';
s[102]:='13927547459020991989083038404429289207944958458536245702640';
s[103]:='54906677482678910726192747555923159377475316999998660943100';
s[104]:='216489185503133990863274261791925599831188392742851863147080';
s[105]:='853702637172735926234421145556838686126761775155774328259240';
s[106]:='3366939372774715522158184331074634818182181954352680060985040';
s[107]:='13280705303722489004068393750349948449496384375502238018329880';
s[108]:='52391773216519910749994580850004383791591241114366627044787600';
s[109]:='206709359781542193322705891717290023323187260396682873976707440';
s[110]:='815663960219058384462569194343901173113117297781505394610791520';
s[111]:='3218959557293069695825496284821467129607123621602012360874730820';
s[112]:='12704920022590345879098861442746675573493602966676969141151592440';
s[113]:='50151000089172417943811295168736877263790538026356457136124707000';
s[114]:='197987426438993719534698504405274280676181776208398535128701017200';
s[115]:='781708976802233823680102715669100177152510806064194216284009188600';
s[116]:='3086748267372923303762456877257472494397093952150920751480446539600';
s[117]:='12190039767760866606383939871203238833805472726290924323643119385200';
s[118]:='48145535217206784075634048230802707999063631776107012034556858076000';
s[119]:='190174864107966797098754490511670696596301345515622697536499589400200';
s[120]:='751269297881058917464501210451062751843240026086509499359064493663600';
s[121]:='2968129521136642608343357241290264314659358135849980153205484311031600';
s[122]:='11727731278637465915893265197293239487190634585553580117543620936271200';
s[123]:='46343454246228695957965322150594252812285572152590760141906244022362000';
s[124]:='183149331181095806425878953139148487114152581147038684080813476376374624';
s[125]:='723875928001473901587997767169015449070222106438295751367024692344718752';
s[126]:='2861304849265668492891140780463352404986232263244287143198790516197234752';
s[127]:='11311095732253345760960290897769189975961199415637572612957718759342193629';
s[128]:='44718285453094622775889522153971216184032648852520635911693306722980765510';
s[129]:='176809220945312585436978572208778500912252165463043129681618151197016257478';
s[130]:='699138751524213124094312216825551629561424593205010237977696200916445964684';
s[131]:='2764775971936660990736598311991954171447451800401631395639071339987763587614';
s[132]:='10934377152170553993439479038404269881062854488806451985760537780703486068308';
s[133]:='43247909631719355347185999181748231619129200590055369794426007640095877732860';
s[134]:='171069509209912116706646841207804116182333282333996796075729541331934805254424';
s[135]:='676730852609799402854235298307342753721289013938899090358400685563095038432942';
s[136]:='2677285562879644352897777603522480091364515660984549685943453807118230006063172';
s[137]:='10592738531393375483204250518284595144094388049982348757428447671641692632684724';
s[138]:='41913713613427025293254228669471419634905851996333034651695296542467129122133800';
s[139]:='165858552441704085803306019163479760555270300042632151407422816318048496669015180';
s[140]:='656376399024616169349253607753345435388942038466586811952779656067170646392272840';
s[141]:='2597771382055171036438595264488592497806939617029730903644099765561619037129981240';
s[142]:='10282088127575012633735978459444359117193900861809983856381541729425708916192792880';
s[143]:='40699932171651091675204914735300588172225857577997852764843602678976764459929805150';
s[144]:='161115593562260183597018076262500259385225118963936327496691227156776984827584194180';
s[145]:='637841185472509493966277041641953081675754238090104091048544721209706145413312768740';
s[146]:='2525330407789119221009341756704875466226455554887350891090156651320061065513932186440';
s[147]:='9998943371381242321023474793439574481139884832189105555262377011307809353994353116580';
s[148]:='39593131470570019928884900188787576804513637926117934749025519709205419589642069387800';
s[149]:='156788800623457278918384204747598804145874006187427021606141058048453461574982594775688';
s[150]:='620925183926009621146978506218967449531342090729015621989883130549504437230725772687824';
       { for i:=142 to 150 do
          begin
                for j:=0 to (i-1)  do s[i]:=add(s[i],nhan1(s[j],s[i-j-1]));
          end};
end;
BEGIN

        assign(f,fi); reset(f); assign(g,fo); rewrite(g);
        xuli;
        while not seekeof(f) do
          begin
                readln(f,n);
                if n=-1 then break;
                writeln(g,s[n]);
          end;
        close(f);
        close(g);
END.


