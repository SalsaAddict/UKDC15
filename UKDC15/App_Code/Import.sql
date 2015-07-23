USE [MYDC]
GO

DECLARE @XML XML

SET @XML = N'
<UKDC>
  <Config>
    <Times>
      <Time id="0">09:30:00</Time>
      <Time id="1">10:30:00</Time>
      <Time id="2">11:30:00</Time>
      <Time id="3">12:30:00</Time>
      <Time id="4">14:00:00</Time>
      <Time id="5">15:00:00</Time>
      <Time id="6">16:00:00</Time>
      <Time id="7">17:00:00</Time>
      <Time id="8">18:00:00</Time>
      <Time id="9">19:00:00</Time>
    </Times>
    <Days>
      <Day id="1" First="17:00:00" Last="19:00:00">Friday</Day>
      <Day id="2" First="09:30:00" Last="17:00:00">Saturday</Day>
      <Day id="3" First="09:30:00" Last="17:00:00">Sunday</Day>
    </Days>
    <Rooms>
      <Room id="1" Description="Reds">Reds</Room>
      <Room id="2" Description="Jaks">Jaks</Room>
      <Room id="3" Description="Yacht Club">Yacht</Room>
      <Room id="4" Description="Princes Suite">Princes</Room>
      <Room id="5" Description="Lounge">Lounge</Room>
      <Room id="6" Description="Kent Suite">Kent</Room>
      <Room id="7" Description="York Suite">York</Room>
      <Room id="8" Description="Regency Suite">Regency</Room>
    </Rooms>
    <Styles>
      <Style id="0" RGB="170,238,255">Beginner Stream</Style>
      <Style id="1" RGB="170,255,170">Salsa On1</Style>
      <Style id="2" RGB="68,170,255">Salsa On2</Style>
      <Style id="3" RGB="255,255,128">Cuban Salsa</Style>
      <Style id="4" RGB="255,102,187">Colombian Salsa</Style>
      <Style id="5" RGB="221,170,255">Bachata</Style>
      <Style id="6" RGB="255,136,136">Kizomba &amp; Afro-Luso</Style>
      <Style id="7" RGB="255,150,68">Lambazouk &amp; Brazilian</Style>
      <Style id="8" RGB="187,187,187">Other</Style>
      <Style id="9" RGB="255,255,255">Closed</Style>
      <Style id="10" RGB="255,174,51">Lindy</Style>
    </Styles>
    <Levels>
      <Level id="0" Code="ALL" Opacity="1.0">All Levels</Level>
      <Level id="1" Code="BEG" Opacity="1.0">Beginner</Level>
      <Level id="2" Code="IMP" Opacity="0.6">Improver</Level>
      <Level id="3" Code="INT" Opacity="0.7">Intermediate</Level>
      <Level id="4" Code="IOA" Opacity="0.8">Int/Adv</Level>
      <Level id="5" Code="ADV" Opacity="0.9">Advanced</Level>
      <Level id="6" Code="TBC" Opacity="1.0">TBC</Level>
      <Level id="7" Code="INT" Opacity="0.7">Intermediate I</Level>
      <Level id="8" Code="INT" Opacity="0.7">Intermediate II</Level>
      <Level id="9" Code="INT" Opacity="0.7">Int I &amp; II</Level>
    </Levels>
    <Artists>
    
      <Artist>
        <Name>Joseph Davids</Name>
        <International>false</International>
        <Picture>JoeDavids.jpg</Picture>
      </Artist>
      <Artist NoAccommodation="true">
        <Name>Pierre Henry</Name>
        <International>false</International>
        <Picture>Pierre.jpg</Picture>
      </Artist>
       <Artist>
        <Name>Andreas &amp; Julia</Name>
        <International>false</International>
        <Picture>AndreasJulia.jpg</Picture>
      </Artist>
   

      <Artist>
        <Name>Alex &amp; Ewelina</Name>
        <International>false</International>
      </Artist>
      <Artist>
        <Name>Ataca &amp; La Alemana</Name>
        <International>true</International>

      </Artist>
      <Artist NoAccommodation="true">
        <Name>Angus &amp; Ovgu</Name>
        <International>false</International>
        <Picture>AngusOvgu.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Anthony Gatfield</Name>
        <International>false</International>
        <Picture>AnthonyGatfield.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Carl &amp; Alex</Name>
        <International>false</International>

      </Artist>
      <Artist>
        <Name>Christian Jean Francios</Name>
        <International>false</International>
        <Picture>CJF.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Dani K</Name>
        <International>false</International>
        <Picture>DaniK.jpg</Picture>
        <Biog>
          <div>
            Dani is one of the new innovators in the latin &amp; afro-caribbean dance scene and he became one of the main teachers and promoters in the UK,
            as well as a recognised choreographer, performer and a popular DJ worldwide recognised mainly because of is weekly travelling across the globe to share through Djing,
            performing and teaching his Passion.
          </div>
        </Biog>
        <Website>http://www.alcadanz.com</Website>
        <Video>http://youtu.be/BeonFBMy4-Y</Video>
      </Artist>
     
      <Artist>
        <Name>Eddie &amp; Kat</Name>
        <International>false</International>
      </Artist>
      <Artist>
        <Name>Fabian &amp; Esther</Name>
        <International>true</International>
        <Picture>FabianEsther.jpg</Picture>
        <Biog>
          <div>
            Fabián &amp; Esther are two lovers of the world of dance, passionate about salsa, Afro-Caribbean rhythms and the latin universe.
            In addition to performing shows and workshops in national and international events, they are committed dance teachers at their Sabor A Fuego Dance School.
          </div>
        </Biog>
        <Website>http://www.saborafuego.es</Website>
      </Artist>
      <Artist>
        <Name>Fadi K</Name>
        <International>false</International>
        <Picture>FadiK.jpg</Picture>
        <Biog>
          <div>
            A combination of tuition from some of the top teachers in the UK and his passion for salsa saw Fadi competing early on in his dancing career.
            He was a success right from the start: 2003 - Tropicana World Open Salsa Championships: 1st place amateur level;
            2004 - Salsa UK Championship (Bar Salsa Open): 3rd place professional level.
            He is regularly seen heating up the floor in clubs all around London and beyond, and continues to find new and creative ways to indulge his passion.
            His infectious sense of humour and smooth clean style mean he is highly in demand and is rarely seen sitting track out.
          </div>
        </Biog>
        <Website>http://www.fkdance.com</Website>
      </Artist>
      
   
     
     
      <Artist>
        <Name>Fabian &amp; Nicolina</Name>
        <International>true</International>
      </Artist>
      <Artist>
        <Name>Fabhiola &amp; Perry</Name>
        <International>false</International>
        <Picture>FabPerry.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Farid Ferchach</Name>
        <International>true</International>
        <Picture>Farid.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Garry &amp; Giselle</Name>
        <International>false</International>
        <Picture>GarryGiselle.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Gus &amp; Grace</Name>
        <International>false</International>
      </Artist>
      <Artist>
        <Name>Joana Carvalho</Name>
        <International>true</International>
      </Artist>
      <Artist>
        <Name>Joao &amp; Giedre</Name>
        <International>true</International>
      </Artist>
      <Artist>
        <Name>Joana &amp; Samet</Name>
        <International>true</International>
     
      </Artist>
     
      <Artist NoAccommodation="true">
        <Name>Phil Kaila</Name>
        <International>false</International>
        <Picture>PhilK.jpg</Picture>
      </Artist>


      <Artist>
        <Name>Lisa &amp; Mark</Name>
        <International>true</International>
      
      </Artist>
     
      <Artist>
        <Name>Lucia Nogueira</Name>
        <International>true</International>
        <Picture>LuciaNogueira.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Luz Fernandez</Name>
        <International>false</International>
        <Picture>Luz.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Magda Sobolewska</Name>
        <International>false</International>
        <Picture>MagdaSobolewska.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Marchant &amp; Davina</Name>
        <International>false</International>
        <Picture>MarchantDavina.jpg</Picture>
        <Biog>
          <div>
            Now representing Alchemy Dance Company as a solo couple, husband &amp; wife team Marchant &amp; Davina are known for their captivating performances,
            world-class choreographies, and excellent teaching methods, they are in high demand to perform and teach around the UK and internationally.<br /><br />
            Over the years many salsa instructors have trained with Marchant &amp; Davina at some point in their dance development.
            Such is the standard of their teaching and depth of knowledge, many salsa instructors,
            teachers of other forms of dance and trained dancers are regularly found at their academy, training bootcamps and in the Alchemy Performance Team.
          </div>
        </Biog>
        <Website>http://www.alchemydance.co.uk</Website>
        <Video>http://youtu.be/_LaFmlT5ihw</Video>
      </Artist>
     
     
      <Artist>
        <Name>Mauro Casali</Name>
        <International>false</International>
      </Artist>
      <Artist >
        <Name>Nelson Campos</Name>
        <International>false</International>
      </Artist>
      
     
      <Artist>
        <Name>Mikko Kemppe</Name>
        <International>true</International>
        <Picture>MikkoKemppe.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Moe Flex</Name>
        <International>false</International>
        <Picture>MoeFlex.jpg</Picture>
        <Biog>
          <div>
            Moe joined the dance circuit in 1998 and immediately excelled to build a reputation that put him on the stage with huge celebrities from the music world as one of the lead choreographers for the MOBO awards.<br /><br />
            Whilst in a dance crew that were ranked in the top ten in the world Moe ventures further a field to find his feet as a professional dancer in other styles of dance.<br /><br />
            With an in depth study of the art of sound and movement Moe created a unique teaching technique that is now used all over the world for dancers of many styles.<br /><br />
            In 2005, paired with a wonderfully gifted dance partner, Angelique Sinclair, Moe’s career in the Latin scene continued to soar and their achievements recognised across the globe.<br /><br />
            Later Moe was joined by Tania Toncheva to tour many countries around the world as well as a very successful solo career.<br /><br />
            As well as a renowned teacher, performer and DJ, Moe took to the stage as a presenter and entertainer to round off any event and made the package complete.<br /><br />
            Now performing with a spectacular dance company OtraDanz to combine the fusion of the many styles and skills between this very versatile group.<br /><br />
            "I want to influence the world, this is my aim. In order to achieve this I must first recognize who influenced me"<br /><br />
            Watching many shows by dance legends on TV put the fire in his belly but there were many people that were there along the journey of this career that helped to shape the dancing, teaching and stage skills that Moe is currently using.
          </div>
        </Biog>
        <Website>http://moeflex.com</Website>
        <Video>http://youtu.be/iSUm0nvQ5Uw</Video>
      </Artist>
      <Artist>
        <Name>Nadia Yammine</Name>
        <International>false</International>
        <Picture>NadiaYammine.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Nelson Flores</Name>
        <International>true</International>
        <Picture>NelsonFlores.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Patrick Mussendjik</Name>
        <International>true</International>
        <Picture>PatrickMussendjik.jpg</Picture>
      </Artist>
      
      
       <Artist>
        <Name>Richard &amp; Dani-Leigh</Name>
        <International>false</International>
        <Picture>RichardDaniLeigh.jpg</Picture>
        <Biog>
          <div>
            Bachatamore was founded in 2011 by dance partnership, and real life couple, Richard Harris &amp; Dani-Leigh Harris, Dance Teachers, Performers and Choreographers.<br /><br />
            Over the last couple of years, Richard &amp; Dani-Leigh have been traveling around the UK teaching and performing at some of the biggest Salsa &amp; Latin Weekenders and Congresses.
          </div>
        </Biog>
        <Website>http://www.bachatamore.com</Website>
      </Artist>
      <Artist>
        <Name>Rico Suave</Name>
        <International>false</International>
        <Picture>RicoSuave.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Riquita Alta</Name>
        <International>false</International>
        <Picture>RiquitaAlta.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Sam &amp; Katie</Name>
        <International>false</International>
        <Picture>SamKatie.jpg</Picture>
      </Artist>
      

      <Artist>
        <Name>Sam Sleek</Name>
        <International>false</International>
        <Picture>SamSleek.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Sami &amp; Roxy</Name>
        <International>false</International>
        <Picture>SamiRoxy.jpg</Picture>
        <Biog>
          <div>
            Born in Cali in Colombia, Sami is part of the dynamic duo Sami and Roxy.
            Sami is the UK Salsa Championship of 2008 and, more recently, ''Top Newcomer'' in the Salsa-Central 2009 awards.
            Sami is well known for fun, spectacular shows with incredibly fast footwork and acrobatic tricks and dips.
            He has a solid performing arts background in ballet, contemporary and salsa, and has been trained by 3 x World Salsa Champions,
            Ricardo Murrillo &amp; Viviana Vargas from Colombia. For the last two years Sami had been teaching and performing at all the major congresses
            and salsa events in the UK.<br /><br />
            Roxy Stanton was 3 years old when she started dancing and is trained in various dance styles including
            Ballet, Tap, Disco, Ballroom, Latin American, Hip-hop, Jazz, Musical theatre and Contemporary (Just to name a few!).
            She became a ballroom finalist when she entered her first competition aged 7 in the prestigious Blackpool and was in the on stage musical,
            Whistle down the Wind, aged 12. When she moved to New Zealand at 14 she continued to develop her professional career,
            appearing in various television programmes and has also appeared as a dancer in the Disney channel''s 6 week series,
            Camp Rock the Tasman. Roxy went on to appear in numerous music videos before discovering and falling in love with Salsa at 15.
            A few months later Roxy was assisting with the classes and was later teaching Salsa, Bachata and Merengue for Viva Latino
            (in New Zealand and at various congresses throughout the country. Roxy has a qualification in the performing arts
            (Excel School of Performing Arts) and has taught and performed with the Salsa Con Coco team who are now the New Zealand champions.
          </div>
        </Biog>
      </Artist>
      <Artist>
        <Name>Saulo &amp; Sabine</Name>
        <International>false</International>
        <Picture>SauloSabine.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Simon &amp; Anna</Name>
        <International>false</International>
        <Biog>
          <div>
            Simon has choreographed and performed for stage, film &amp; TV including My Week with Marilyn, Dancing on Ice, The Apprentice and Strictly Come Dancing. He has been a UK and US dance champion and a World Lindy Hop Judge and has authored two instructional books on Swing dancing.
            Through the London Swing Dance Society which he founded in 1986, the UK''s longest running swing dance club (now known as Swingdance UK), he has taught 1000''s to dance, and he has travelled internationally to teach and perform, including 20 years at the Herrang Dance Camp. 
            Many of his past students have gone on to become successful teachers and performers themselves.<br /><br />
            Anna joined Simon in 2012 and together they have performed on ITV’s Paul O’Grady Show, performed for Prince William at Beating Retreat, they were featured dancers in a forthcoming Keith Lemon TV show, and many festivals and shows such as CarFest and the Ideal Home Exhibition.

          </div>
        </Biog>
      </Artist>
      <Artist>
        <Name>Ichtiandras &amp; Griušyte</Name>
        <International>true</International>
        <Biog>
          <div>
            Ichtiandras Veliulis &amp; Solveiga Griušyte <br /><br />
            Ichtis started dancing in 1984 and he did different styles: Break dance, Boogie Woogie, Rock''n''Roll. In 1992-2000 Ichtis was dancing and performing at show agency Kakadu Klaipeda. In 1995 he started Lindy Hop and became the Lindy Hop pioneer of Lithuania!
            <br /><br />
            Solveiga started dancing ballroom at age 5. she met Ichtis in 1999 and together they started dancing Lindy Hop. They took part in competitions (1pl.in Estonia 2001, 2pl.in Holland Open Benelux 2002). They made several TV-appearances on Lithuanian and Russian TV.
<br /><br />
            Ichtis and Solveiga have also a long-standing teaching career in various countries (Russia, Estonia, Latvia, Germany and Herrang dance camp in Sweden).
<br /><br />
            They moved to England in 2006 and have been teaching in several places including: Portsmouth, Oving, Botley, Fareham, Chichester, The 100 Club in London, Wild Times in London. They also run the Andover Lindy Hoppers!

          </div>
        </Biog>
      </Artist>
      <Artist>
        <Name>Taina Kortelainen</Name>
        <International>true</International>
        <Biog>
          <div>
            Taina Kortelainen is the driving force behind Would You Dance.
            She has been teaching, competing, performing and judging various forms of partnered dancing all over Europe for 20+ years.<br /><br />

            Taina runs dance workshops from total Beginner to advanced + coaches performers, new teachers and competitors. Different dance styles range from Swing Dances: Lindy, Balboa, Charleston, Collegiate Shag etc to Solo Jazz (Big Apple, Tranky Doo, Shim Sham etc) and Ballroom &amp; Latin!
            To top it all she is UK, USA and Finnish Champion!

          </div>
        </Biog>
      </Artist>
      <Artist>
        <Name>Lizzie Abrahams</Name>
        <International>false</International>
        <Biog>
          <div>
            Lizzie has been dancing different dances since she was 4, with an impressive 21 years of Lindy Hop. Ballroom, Latin and Tango are also great loves so whatever music comes on be sure to ask her to dance.
<br /><br />
            Lizzie runs the annual Brighton Lindy Hop and Balboa Festivals.


          </div>
        </Biog>
      </Artist>
      <Artist>
        <Name>Simon &amp; Becky</Name>
        <International>false</International>
        <Picture>SimonBecky.jpg</Picture>
      </Artist>
      <Artist>
        <Name>Simon &amp; Natalie</Name>
        <International>false</International>       
      </Artist>
      <Artist>
        <Name>Sol &amp; Laura</Name>
        <International>false</International>
      </Artist>
      <Artist>
        <Name>Tony &amp; Sophie</Name>
        <International>true</International>
      </Artist>
      <Artist>
        <Name>Uriel &amp; Vera</Name>
        <International>true</International>
      </Artist>

      <Artist>
        <Name>YE Mambo</Name>
        <International>true</International>
        <Picture>YEMambo.jpg</Picture>
      </Artist>
      <Artist NoAccommodation="true">
        <Name>Zoe Hodges</Name>
        <International>false</International>
        <Picture>ZoeHodges.jpg</Picture>
      </Artist>
    
    </Artists>
    <Helpers>
      <Team Name="UKDC Organisers">
        <Helper Artist="Joseph Davids">Joseph Davids</Helper>
        <Helper Artist="Pierre Henry">Pierre Henry</Helper>
        <Helper Artist="Zoe Hodges">Zoe Hodges</Helper>
        <Helper>Darryl Peterson</Helper>
        <Helper>Ramiro Zapata</Helper>
        <Helper Artist="Phil Kaila">Phil Kaila</Helper>
      </Team>
      <Team Name="Latin Collective">
        <Helper Artist="Sam &amp; Katie">Katie Bretherick</Helper>
        <Helper Artist="Sam &amp; Katie">Sam Hounsell</Helper>
        <Helper Artist="Ka Fai &amp; Amy">Ka Fai Leung</Helper>
        <Helper Artist="Ka Fai &amp; Amy">Amy Valentine</Helper>
        <Helper>Raluca Lehadus</Helper>
        <Helper>Alex Rasero</Helper>
        <Helper>Loli Dianez</Helper>
        <Helper>Ewelina Gluchowska</Helper>
        <Helper>Sammy Atmane</Helper>
        <Helper>Maja Maj</Helper>
      </Team>
      <Team Name="Salsa Northwest">
        <Helper>Sandra Kinder</Helper>
        <Helper>Carole Walsh</Helper>
        <Helper>Pamela Gregson</Helper>
        <Helper>Maria O''Sullivan</Helper>
      </Team>
      <Team Name="Tropicana">
        <Helper>Mihaela</Helper>
        <Helper Artist="Carlos &amp; Mabel">Maria Fuertes Rojo</Helper>
        <Helper Artist="Javier &amp; Alba">Javier Ramirez</Helper>
      </Team>
    </Helpers>
  </Config>
  <Workshops>
    <Day Name="Friday">
      <Room Name="Jaks">
        <Slot Time="17:00:00" Helper="">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Sensual</Title>
            <Artist>Andreas &amp; Julia</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="18:00:00" Helper="">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Simon &amp; Natalie</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="19:00:00" Helper="">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Daniel &amp; Pebbles</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Lounge">
        <Slot Time="18:00:00" Helper="">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Phil Kaila</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="19:00:00" Helper="">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Carl &amp; Alex</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Princes">
        <Slot Time="18:00:00" Helper="">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Christian Jean-Francois</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="19:00:00" Helper="">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>David &amp; Adriana</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Regency">
        <Slot Time="17:00:00" Helper="">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>TBA</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="18:00:00" Helper="">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>TBA</Artist>
            <Level>Int I &amp; II</Level>
          </Workshop>
        </Slot>
        <Slot Time="19:00:00" Helper="">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Social Big Apple</Title>
            <Artist>TBA</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
      </Room>
    </Day>
    <Day Name="Saturday">
      <Room Name="Kent">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>Leo Henriquez</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>Misael</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>Osbanis &amp; Aneta</Artist>
            <Level>Advanced</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Cha Cha</Title>
            <Artist>Sam Sleek</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Other</Style>
            <Title>Musicality</Title>
            <Artist>Moe Flex</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Riquita Alta</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Reds">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On 1</Title>
            <Artist>Marchant &amp; Davina</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On 1</Title>
            <Artist>Phil Kaila</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On 1</Title>
            <Artist>Farid Ferchach</Artist>
            <Level>Advanced</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On 1</Title>
            <Artist>Lisa &amp; Mark</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On 1</Title>
            <Artist>Uriel &amp; Vera</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On 1</Title>
            <Artist>Gary &amp; Giselle</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Mens'' Styling</Title>
            <Artist>Dani K</Artist>
            <Level>All Levels</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Ladies'' Styling</Title>
            <Artist>Joana Carvalho</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>YE Mambo</Artist>
            <Level>Advanced</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>Mikko Kemppe</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>Richard &amp; Dani-Leigh</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>Marchant &amp; Davina</Artist>
            <Level>Advanced</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>Patrick Mussendijk</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Yacht">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Closed</Style>
            <Title>CLOSED</Title>
            <Artist></Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Closed</Style>
            <Title>CLOSED</Title>
            <Artist></Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Other</Style>
            <Title>Hip Hop</Title>
            <Artist>Moe Flex</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>La Rueda</Title>
            <Artist>Fadi K</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Afro-Cuban</Title>
            <Artist>Osbanis &amp; Aneta</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>Leo Henriquez</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Closed</Style>
            <Title>CLOSED</Title>
            <Artist></Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Jaks">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Angus &amp; Ovgu</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Gus &amp; Grace</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Dominican Bachata</Title>
            <Artist>Richard &amp; Dani-Leigh</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Dominican Bachata</Title>
            <Artist>Amanda Hawley</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Touch Bachata</Title>
            <Artist>Ataca &amp; La Alemana</Artist>
            <Level>Advanced</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Fabian &amp; Nicolina</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Carl &amp; Alex</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Uriel &amp; Vera</Artist>
            <Level>Advanced</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Simon &amp; Natalie</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Alex &amp; Ewelina</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Sol &amp; Laura</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Touch Bachata</Title>
            <Artist>Ataca &amp; La Alemana</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Andreas &amp; Julia</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Lounge">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Nelson Campos</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Joao &amp; Giedre</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Semba</Title>
            <Artist>Tony &amp; Sophie</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>David &amp; Adriana</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Semba</Title>
            <Artist>Nelson Campos</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Tony &amp; Sophie</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Semba</Title>
            <Artist>Joao &amp; Giedre</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Princes">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>Patrick Mussendijk</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>YE Mambo</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>Fabian &amp; Esther</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Mauro Casali</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Lifts &amp; Tricks</Title>
            <Artist>Farid Ferchach</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Joana &amp; Samet</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Fabian &amp; Esther</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="York">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Beginner Stream</Style>
            <Title>Salsa On1 (Part I)</Title>
            <Artist>Zoe Hodges</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Beginner Stream</Style>
            <Title>Salsa On1 (Part II)</Title>
            <Artist>Zoe Hodges</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Colombian Salsa</Style>
            <Title>Cali Partnerwork</Title>
            <Artist>Sami &amp; Roxy</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata (Part I)</Title>
            <Artist>Sam &amp; Katie</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata (Part II)</Title>
            <Artist>Sam &amp; Katie</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Colombian Salsa</Style>
            <Title>Cali Partnerwork</Title>
            <Artist>Luz Fernandez</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Colombian Salsa</Style>
            <Title>Cali Show</Title>
            <Artist>Sabine &amp; Saulo</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Regency">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Taina Kortelainen</Artist>
            <Level>Intermediate I</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Lizzie Abrahams</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Ichtiandras &amp; Griušyte</Artist>
            <Level>Intermediate II</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Balboa</Title>
            <Artist>Simon &amp; Anna</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Easy Airsteps</Title>
            <Artist>Ichtiandras &amp; Griušyte</Artist>
            <Level>All Levels</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Lizzie Abrahams</Artist>
            <Level>Intermediate I</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Simon &amp; Anna</Artist>
            <Level>Intermediate II</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Taina Kortelainen</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Simon &amp; Anna</Artist>
            <Level>Intermediate I</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>20s Charleston</Title>
            <Artist>Taina Kortelainen</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
           <Artist>Ichtiandras &amp; Griušyte</Artist>
            <Level>Intermediate I</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Simon &amp; Anna</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Ichtiandras &amp; Griušyte</Artist>
            <Level>Intermediate II</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Shim Sham</Title>
            <Artist>Lizzie Abrahams</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
      </Room>
    </Day>
    <Day Name="Sunday">
      <Room Name="Kent">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>Fabhiola &amp; Perry</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>TBA</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Rumba</Title>
            <Artist>Osbanis &amp; Aneta</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Other</Style>
            <Title>To be scheduled</Title>
            <Artist></Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Riquita Alta</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Cha Cha</Title>
            <Artist>Mauro Casali</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
      </Room>  
      <Room Name="Reds">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On 2</Title>
            <Artist>Mikko Kempe</Artist>
            <Level>TBC</Level>
          </Workshop>
          
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On 2</Title>
            <Artist>YE Mambo</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On 2</Title>
            <Artist>Cliff &amp; Miho</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On 2</Title>
            <Artist>Patrick Mussendijk</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On 2</Title>
            <Artist>Lisa &amp; Mark</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Fabian &amp; Esther</Artist>
            <Level>TBC</Level>
          </Workshop>
          
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Men''s Shines</Title>
            <Artist>Farid Ferchach</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Ladies'' Shines</Title>
            <Artist>Joana Carvalho</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Uriel &amp; Vera</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork with Tricks</Title>
            <Artist>Pierre &amp; Zoe</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Fabian &amp; Esther</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Sam Sleek</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Yacht">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Closed</Style>
            <Title>CLOSED</Title>
            <Artist></Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Closed</Style>
            <Title>CLOSED</Title>
            <Artist></Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Other</Style>
            <Title>To be scheduled</Title>
            <Artist>TBA</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>La Rueda</Title>
            <Artist>Moe Flex</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>Misael</Artist>
            <Level>Intermediate</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Cuban Salsa</Style>
            <Title>Cuban Partnerwork</Title>
            <Artist>Leo Henriquez</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Closed</Style>
            <Title>CLOSED</Title>
            <Artist></Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Jaks">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Fabian &amp; Nicolina</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Uriel &amp; Vera</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Alex &amp; Ewelina</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Angus &amp; Ovgu</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Gus &amp; Grace</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Touch Bachata</Title>
            <Artist>Ataca &amp; La Alemana</Artist>
            <Level>Advanced</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Daniel &amp; Pebbles</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Bachata Moderna</Title>
            <Artist>Simon &amp; Natalie</Artist>
            <Level>Intermediate</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Fabian &amp; Nicolina</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Dominican Fusion</Title>
            <Artist>Richard &amp; Dani-Leigh</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Dominican Bachata</Title>
            <Artist>Amanda Hawley</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Bachata</Style>
            <Title>Sensual Bachata</Title>
            <Artist>Sol &amp; Laura</Artist>
            <Level>TBC</Level>
          </Workshop>
          <Workshop>
            <Style>Bachata</Style>
            <Title>Social Bachata</Title>
            <Artist>Pierre Henry</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Lounge">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Joao &amp; Giedre</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>David &amp; Adriana</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Riquita Alta</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Tony &amp; Sophie</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba</Title>
            <Artist>Nelson Campos</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Semba de Roda</Title>
            <Artist>Christian Jean-Francois</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Semba</Title>
            <Artist>Joao &amp; Giedre</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Princes">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Marchant &amp; Davina</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Farid Ferchach</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Salsa On1</Style>
            <Title>Partnerwork On1</Title>
            <Artist>Fadi K</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Pachanga</Title>
            <Artist>YE Mambo</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Partnerwork On2</Title>
            <Artist>Patrick Mussendijk</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Funky Flex Moves</Title>
            <Artist>Moe Flex</Artist>
            <Level>TBC</Level>
          </Workshop>
        </Slot>
       
      </Room>
      <Room Name="York">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Into to On2 (Part I)</Title>
            <Artist>Joseph Davids</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Salsa On2</Style>
            <Title>Into to On2 (Part II)</Title>
            <Artist>Joseph Davids</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Colombian Salsa</Style>
            <Title>Cali Partnerwork</Title>
            <Artist>Sabine &amp; Saulo</Artist>
            <Level>Improver</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba (Part I)</Title>
            <Artist>Nadia Yammine</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Kizomba &amp; Afro-Luso</Style>
            <Title>Kizomba (Part II)</Title>
            <Artist>Nadia Yammine</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Colombian Salsa</Style>
            <Title>Cali Tricks</Title>
            <Artist>Sami &amp; Roxy</Artist>
            <Level>Int/Adv</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Colombian Salsa</Style>
            <Title>Cali Ladies Styling</Title>
            <Artist>Luz Fernandez</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
      </Room>
      <Room Name="Regency">
        <Slot Time="09:30:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Taina Kortelainen</Artist>
            <Level>Beginner</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Lizzie Abrahams</Artist>
            <Level>Intermediate I</Level>
          </Workshop>
        </Slot>
        <Slot Time="10:30:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Simon &amp; Anna</Artist>
            <Level>Intermediate II</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Blackbottom</Title>
            <Artist>Ichtiandras &amp; Griušyte</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="11:30:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Shag</Title>
            <Artist>Lizzie Abrahams</Artist>
            <Level>All Levels</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Ichtiandras &amp; Griušyte</Artist>
            <Level>Beginner</Level>
          </Workshop>
        </Slot>
        <Slot Time="14:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Taina Kortelainen</Artist>
            <Level>Intermediate II</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Simon &amp; Anna</Artist>
            <Level>Intermediate I</Level>
          </Workshop>
        </Slot>
        <Slot Time="15:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Lizzie Abrahams</Artist>
            <Level>Beginner</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Easy Airsteps</Title>
            <Artist>Simon &amp; Anna</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
        <Slot Time="16:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Ichtiandras &amp; Griušyte</Artist>
            <Level>Beginner</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Taina Kortelainen</Artist>
            <Level>Intermediate I</Level>
          </Workshop>
        </Slot>
        <Slot Time="17:00:00">
          <Workshop>
            <Style>Lindy</Style>
            <Title>Lindy</Title>
            <Artist>Lizzie Abrahams</Artist>
            <Level>Intermediate II</Level>
          </Workshop>
          <Workshop>
            <Style>Lindy</Style>
            <Title>Jazz Roots</Title>
            <Artist>Taina Kortelainen</Artist>
            <Level>All Levels</Level>
          </Workshop>
        </Slot>
      </Room>
    </Day>
  </Workshops>
  <Helpdesk>
    <Day Name="Friday">
      <Slot Start="15:00:00" Hours="6">
        <Helper>Darryl Peterson</Helper>
      </Slot>
      <Slot Start="21:00:00" Hours="2">
        <Helper>Sandra Kinder</Helper>
      </Slot>
    </Day>
    <Day Name="Saturday">
      <Slot Start="09:00:00" Hours="2">
        <Helper>Pierre Henry</Helper>
        <Helper>Zoe Hodges</Helper>
      </Slot>
      <Slot Start="11:00:00" Hours="2">
        <Helper>unknown</Helper>
      </Slot>
      <Slot Start="13:00:00" Hours="2">
        <Helper>Darryl Peterson</Helper>
      </Slot>
      <Slot Start="15:00:00" Hours="2">
        <Helper>Joseph Davids</Helper>
      </Slot>
      <Slot Start="17:00:00" Hours="2">
        <Helper>Ramiro Zapata</Helper>
      </Slot>
    </Day>
    <Day Name="Sunday">
      <Slot Start="09:00:00" Hours="2">
        <Helper>Phil Kaila</Helper>
        <Helper>Sandra Kinder</Helper>
      </Slot>
      <Slot Start="11:00:00" Hours="2">
        <Helper>Joseph Davids</Helper>
      </Slot>
      <Slot Start="13:00:00" Hours="2">
        <Helper>Pierre Henry</Helper>
        <Helper>Zoe Hodges</Helper>
      </Slot>
      <Slot Start="15:00:00" Hours="2">
        <Helper>Darryl Peterson</Helper>
      </Slot>
      <Slot Start="17:00:00" Hours="2">
        <Helper>Unknown</Helper>
      </Slot>
    </Day>
  </Helpdesk>
</UKDC>'

SELECT
 [Date] = CONVERT(DATE, CASE LEFT(UPPER(LTRIM(RTRIM((w.value(N'../../../@Name', N'NVARCHAR(25)'))))), 3)
	  WHEN N'FRI' THEN N'2015-09-11'
			WHEN N'SAT' THEN N'2015-09-12'
			WHEN N'SUN' THEN N'2015-09-13'
	 END),
 [Room] = LTRIM(RTRIM(w.value(N'../../@Name', N'NVARCHAR(25)'))),
 [Time] = w.value(N'../@Time', N'TIME'),
 [Style] = NULLIF(LTRIM(RTRIM(w.value(N'Style[1]', N'NVARCHAR(25)'))), N''),
 [Artist] = NULLIF(LTRIM(RTRIM(w.value(N'Artist[1]', N'NVARCHAR(255)'))), N''),
	[Title] = NULLIF(LTRIM(RTRIM(w.value(N'Title[1]', N'NVARCHAR(255)'))), N''),
	[Level] = NULLIF(LTRIM(RTRIM(w.value(N'Level[1]', N'NVARCHAR(25)'))), N'')
INTO [#Timetable]
FROM @XML.nodes(N'/UKDC[1]/Workshops/Day/Room/Slot/Workshop') ws (w)

UPDATE [#Timetable] SET [Level] = N'Intermediate' WHERE [Level] IN (N'Int I & II', N'Intermediate I')
UPDATE [#Timetable] SET [Level] = N'Int/Adv' WHERE [Level] = N'Intermediate II'
UPDATE [#Timetable] SET [Level] = NULL WHERE [Level] = N'TBC'

SELECT
 [Room] = r.value(N'.', N'NVARCHAR(25)'),
	[Sort] = r.value(N'@id', N'TINYINT')
INTO [#Rooms]
FROM @XML.nodes(N'/UKDC[1]/Config[1]/Rooms[1]/Room') rm (r)

BEGIN TRANSACTION

DECLARE @EventId INT

INSERT INTO [Style] ([Name], [R], [G], [B], [Sort])
OUTPUT [inserted].*
SELECT
 [Name] = s.value(N'.', N'NVARCHAR(25)'),
 [R] = [RGB].value(N'rgb[1]', N'TINYINT'),
	[G] = [RGB].value(N'rgb[2]', N'TINYINT'),
	[B] = [RGB].value(N'rgb[3]', N'TINYINT'),
	[Sort] = s.value(N'@id', N'TINYINT')
FROM @XML.nodes(N'/UKDC[1]/Config[1]/Styles[1]/Style') sty (s)
 CROSS APPLY (SELECT CONVERT(XML, N'<rgb>' + REPLACE(s.value(N'@RGB', N'NVARCHAR(11)'), N',', N'</rgb><rgb>') + N'</rgb>')) c ([RGB])

INSERT INTO [Level] ([Name], [Opacity], [Sort])
OUTPUT [inserted].*
SELECT
 [Name] = l.value(N'.', N'NVARCHAR(25)'),
	[Opacity] = l.value(N'@Opacity', N'DECIMAL(3,2)'),
	[Sort] = ROW_NUMBER() OVER (ORDER BY l.value(N'@id', N'TINYINT'))
FROM @XML.nodes(N'/UKDC[1]/Config[1]/Levels[1]/Level') lvl (l)
WHERE l.value(N'.', N'NVARCHAR(25)') NOT IN (N'Int I & II', N'Intermediate I', N'Intermediate II', N'TBC')

INSERT INTO [Event] ([Name], [StartDate], [EndDate])
OUTPUT [inserted].*
VALUES (N'UK Dance Congress 2015', N'2015-09-11', N'2015-09-14')
SET @EventId = SCOPE_IDENTITY()

INSERT INTO [EventDate] ([EventId], [Date], [StartDate], [EndDate])
OUTPUT [inserted].*
SELECT e.[Id], dte.[Date], e.[StartDate], e.[EndDate]
FROM [Event] e
 CROSS APPLY (VALUES (N'2015-09-11'), (N'2015-09-12'), (N'2015-09-13')) dte ([Date])
WHERE e.[Id] = @EventId

INSERT INTO [EventDateRoom] ([EventId], [Date], [Room], [Sort])
OUTPUT [inserted].*
SELECT DISTINCT @EventId, t.[Date], t.[Room], DENSE_RANK() OVER (PARTITION BY t.[Date] ORDER BY r.[Sort])
FROM [#Timetable] t
 JOIN [#Rooms] r ON t.[Room] = r.[Room]

INSERT INTO [EventDateTime] ([EventId], [Date], [Time])
OUTPUT [inserted].*
SELECT DISTINCT @EventId, [Date], [Time]
FROM [#Timetable]

INSERT INTO [Workshop] ([EventId], [Date], [Time], [Room], [Artist], [Title], [Style], [Level])
OUTPUT [inserted].*
SELECT DISTINCT @EventId, [Date], [Time], [Room], [Artist], [Title], [Style], [Level]
FROM [#Timetable]

ROLLBACK TRANSACTION

DROP TABLE [#Rooms]
DROP TABLE [#Timetable]