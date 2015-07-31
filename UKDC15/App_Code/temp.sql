﻿USE [MYDC]
GO

DECLARE @Import XML

SET @Import = N'
<Event Name="UK Dance Congress 2015" Start="2015-09-11" End="2015-09-14">
  <Artists>
    <Artist Name="Alex &amp; Ewelina" Workshops="2" />
    <Artist Name="Amanda Hawley" Workshops="2" />
    <Artist Name="Andreas &amp; Julia" Workshops="2" />
    <Artist Name="Angus &amp; Ovgu" Workshops="2" />
    <Artist Name="Ataca &amp; La Alemana" Workshops="3" />
    <Artist Name="Carl &amp; Alex" Workshops="2" />
    <Artist Name="Christian Jean-Francois" Workshops="2" />
    <Artist Name="Cliff &amp; Miho" Workshops="1" />
    <Artist Name="Dani K" Workshops="1" />
    <Artist Name="Daniel &amp; Pebbles" Workshops="2" />
    <Artist Name="David &amp; Adriana" Workshops="3" />
    <Artist Name="Fabhiola &amp; Perry" Workshops="1" />
    <Artist Name="Fabian &amp; Esther" Workshops="4" />
    <Artist Name="Fabian &amp; Nicolina" Workshops="3" />
    <Artist Name="Fadi K" Workshops="2" />
    <Artist Name="Farid Ferchach" Workshops="4" />
    <Artist Name="Garry &amp; Giselle" Workshops="1" />
    <Artist Name="Gus &amp; Grace" Workshops="2" />
    <Artist Name="Ichtiandras &amp; Griušyte" Workshops="7" />
    <Artist Name="Joana &amp; Samet" Workshops="1" />
    <Artist Name="Joana Carvalho" Workshops="2" />
    <Artist Name="Joao &amp; Giedre" Workshops="4" />
    <Artist Name="Joseph Davids" Workshops="2" />
    <Artist Name="Leo Henriquez" Workshops="3" />
    <Artist Name="Lisa &amp; Mark" Workshops="2" />
    <Artist Name="Lizzie Abrahams" Workshops="7" />
    <Artist Name="Luz Fernandez" Workshops="2" />
    <Artist Name="Marchant &amp; Davina" Workshops="3" />
    <Artist Name="Mauro Casali" Workshops="2" />
    <Artist Name="Mikko Kemppe" Workshops="2" />
    <Artist Name="Misael" Workshops="2" />
    <Artist Name="Moe Flex" Workshops="4" />
    <Artist Name="Nadia Yammine" Workshops="2" />
    <Artist Name="Nelson Campos" Workshops="3" />
    <Artist Name="Osbanis &amp; Aneta" Workshops="3" />
    <Artist Name="Patrick Mussendijk" Workshops="4" />
    <Artist Name="Phil Kaila" Workshops="2" />
    <Artist Name="Pierre" Workshops="1" />
    <Artist Name="Pierre &amp; Zoe" Workshops="1" />
    <Artist Name="Pierre Henry" Workshops="1" />
    <Artist Name="Richard &amp; Dani-Leigh" Workshops="3" />
    <Artist Name="Riquita Alta" Workshops="3" />
    <Artist Name="Sabine &amp; Saulo" Workshops="2" />
    <Artist Name="Sam &amp; Katie" Workshops="2" />
    <Artist Name="Sam Sleek" Workshops="2" />
    <Artist Name="Sami &amp; Roxy" Workshops="2" />
    <Artist Name="Simon &amp; Anna" Workshops="7" />
    <Artist Name="Simon &amp; Natalie" Workshops="3" />
    <Artist Name="Sol &amp; Laura" Workshops="2" />
    <Artist Name="Taina Kortelainen" Workshops="7" />
    <Artist Name="Tony &amp; Sophie" Workshops="3" />
    <Artist Name="Uriel &amp; Vera" Workshops="4" />
    <Artist Name="YE Mambo" Workshops="4" />
    <Artist Name="Zoe Hodges" Workshops="2" />
  </Artists>
  <Workshops>
    <Day Date="2015-09-11">
      <Room Name="Jaks">
        <Slot Time="17:00">
          <Workshop Artist="Andreas &amp; Julia" Title="Bachata Sensual" Style="Bachata" Level="All Levels" />
        </Slot>
        <Slot Time="18:00">
          <Workshop Artist="Simon &amp; Natalie" Title="Bachata Moderna" Style="Bachata" Level="All Levels" />
        </Slot>
        <Slot Time="19:00">
          <Workshop Artist="Daniel &amp; Pebbles" Title="Sensual Bachata" Style="Bachata" Level="All Levels" />
        </Slot>
      </Room>
      <Room Name="Princes">
        <Slot Time="17:00" />
        <Slot Time="18:00">
          <Workshop Artist="Christian Jean-Francois" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" Level="Improver" />
        </Slot>
        <Slot Time="19:00">
          <Workshop Artist="David &amp; Adriana" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" Level="Intermediate" />
        </Slot>
      </Room>
      <Room Name="Lounge">
        <Slot Time="17:00" />
        <Slot Time="18:00">
          <Workshop Artist="Phil Kaila" Title="Partnerwork On1" Style="Salsa On1" Level="Improver" />
        </Slot>
        <Slot Time="19:00">
          <Workshop Artist="Carl &amp; Alex" Title="Partnerwork On1" Style="Salsa On1" Level="Intermediate" />
        </Slot>
      </Room>
      <Room Name="Regency">
        <Slot Time="17:00">
          <Workshop Title="Lindy" Style="Lindy" Level="Beginner" />
        </Slot>
        <Slot Time="18:00">
          <Workshop Title="Lindy" Style="Lindy" Level="Intermediate" />
        </Slot>
        <Slot Time="19:00">
          <Workshop Title="Social Big Apple" Style="Lindy" Level="All Levels" />
        </Slot>
      </Room>
    </Day>
    <Day Date="2015-09-12">
      <Room Name="Reds">
        <Slot Time="10:00">
          <Workshop Artist="Marchant &amp; Davina" Title="Partnerwork On 1" Style="Salsa On1" Level="Int/Adv" />
          <Workshop Artist="Phil Kaila" Title="Partnerwork On 1" Style="Salsa On1" Level="Improver" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Farid Ferchach" Title="Partnerwork On 1" Style="Salsa On1" Level="Advanced" />
          <Workshop Artist="Lisa &amp; Mark" Title="Partnerwork On 1" Style="Salsa On1" Level="Intermediate" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Garry &amp; Giselle" Title="Partnerwork On 1" Style="Salsa On1" Level="Improver" />
          <Workshop Artist="Uriel &amp; Vera" Title="Partnerwork On 1" Style="Salsa On1" Level="Int/Adv" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Dani K" Title="Mens'' Styling" Style="Salsa On2" Level="All Levels" />
          <Workshop Artist="Joana Carvalho" Title="Ladies'' Styling" Style="Salsa On2" Level="All Levels" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="YE Mambo" Title="Partnerwork On2" Style="Salsa On2" Level="Advanced" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Mikko Kemppe" Title="Partnerwork On2" Style="Salsa On2" Level="Int/Adv" />
          <Workshop Artist="Richard &amp; Dani-Leigh" Title="Partnerwork On2" Style="Salsa On2" Level="Improver" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Marchant &amp; Davina" Title="Partnerwork On2" Style="Salsa On2" Level="Advanced" />
          <Workshop Artist="Patrick Mussendijk" Title="Partnerwork On2" Style="Salsa On2" Level="Intermediate" />
        </Slot>
      </Room>
      <Room Name="Jaks">
        <Slot Time="10:00">
          <Workshop Artist="Angus &amp; Ovgu" Title="Sensual Bachata" Style="Bachata" Level="Int/Adv" />
          <Workshop Artist="Gus &amp; Grace" Title="Sensual Bachata" Style="Bachata" Level="Improver" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Amanda Hawley" Title="Dominican Bachata" Style="Bachata" Level="Improver" />
          <Workshop Artist="Richard &amp; Dani-Leigh" Title="Dominican Bachata" Style="Bachata" Level="Int/Adv" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Ataca &amp; La Alemana" Title="Touch Bachata" Style="Bachata" Level="Advanced" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Carl &amp; Alex" Title="Sensual Bachata" Style="Bachata" Level="Improver" />
          <Workshop Artist="Fabian &amp; Nicolina" Title="Sensual Bachata" Style="Bachata" Level="Int/Adv" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Simon &amp; Natalie" Title="Bachata Moderna" Style="Bachata" Level="Intermediate" />
          <Workshop Artist="Uriel &amp; Vera" Title="Bachata Moderna" Style="Bachata" Level="Advanced" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Alex &amp; Ewelina" Title="Sensual Bachata" Style="Bachata" Level="Int/Adv" />
          <Workshop Artist="Sol &amp; Laura" Title="Sensual Bachata" Style="Bachata" Level="Improver" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Andreas &amp; Julia" Title="Bachata Moderna" Style="Bachata" Level="Improver" />
          <Workshop Artist="Ataca &amp; La Alemana" Title="Touch Bachata" Style="Bachata" Level="Int/Adv" />
        </Slot>
      </Room>
      <Room Name="Yacht">
        <Slot Time="10:00" />
        <Slot Time="11:00" />
        <Slot Time="12:00">
          <Workshop Artist="Moe Flex" Title="Hip Hop" Style="Other" Level="All Levels" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Fadi K" Title="La Rueda" Style="Cuban Salsa" Level="All Levels" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Osbanis &amp; Aneta" Title="Afro-Cuban" Style="Cuban Salsa" Level="Intermediate" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Leo Henriquez" Title="Cuban Partnerwork" Style="Cuban Salsa" Level="Int/Adv" />
        </Slot>
        <Slot Time="17:30" />
      </Room>
      <Room Name="Princes">
        <Slot Time="10:00">
          <Workshop Artist="Patrick Mussendijk" Title="Partnerwork On2" Style="Salsa On2" Level="Improver" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="YE Mambo" Title="Partnerwork On2" Style="Salsa On2" Level="Intermediate" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Fabian &amp; Esther" Title="Partnerwork On2" Style="Salsa On2" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Mauro Casali" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Farid Ferchach" Title="Lifts &amp; Tricks" Style="Salsa On1" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Joana &amp; Samet" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Fabian &amp; Esther" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
      </Room>
      <Room Name="Lounge">
        <Slot Time="10:00">
          <Workshop Artist="Nelson Campos" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Joao &amp; Giedre" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Tony &amp; Sophie" Title="Semba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="David &amp; Adriana" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Nelson Campos" Title="Semba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Tony &amp; Sophie" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Joao &amp; Giedre" Title="Semba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
      </Room>
      <Room Name="Kent">
        <Slot Time="10:00">
          <Workshop Artist="Leo Henriquez" Title="Cuban Partnerwork" Style="Cuban Salsa" Level="Improver" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Misael" Title="Cuban Partnerwork" Style="Cuban Salsa" Level="Intermediate" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Osbanis &amp; Aneta" Title="Cuban Partnerwork" Style="Cuban Salsa" Level="Advanced" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Sam Sleek" Title="Cha Cha" Style="Salsa On2" Level="All Levels" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Moe Flex" Title="Musicality" Style="Other" Level="All Levels" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Riquita Alta" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="17:30" />
      </Room>
      <Room Name="York">
        <Slot Time="10:00">
          <Workshop Artist="Zoe Hodges" Title="Salsa On1 (Part I)" Style="Beginner Stream" Level="Beginner" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Zoe Hodges" Title="Salsa On1 (Part II)" Style="Beginner Stream" Level="Beginner" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Sami &amp; Roxy" Title="Cali Partnerwork" Style="Colombian Salsa" Level="Improver" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Sam &amp; Katie" Title="Bachata (Part I)" Style="Bachata" Level="Beginner" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Sam &amp; Katie" Title="Bachata (Part II)" Style="Bachata" Level="Beginner" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Luz Fernandez" Title="Cali Partnerwork" Style="Colombian Salsa" Level="Intermediate" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Sabine &amp; Saulo" Title="Cali Show" Style="Colombian Salsa" Level="Int/Adv" />
        </Slot>
      </Room>
      <Room Name="Regency">
        <Slot Time="10:00">
          <Workshop Artist="Lizzie Abrahams" Title="Lindy" Style="Lindy" Level="Beginner" />
          <Workshop Artist="Taina Kortelainen" Title="Lindy" Style="Lindy" Level="Intermediate" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Ichtiandras &amp; Griušyte" Title="Lindy" Style="Lindy" Level="Int/Adv" />
          <Workshop Artist="Simon &amp; Anna" Title="Balboa" Style="Lindy" Level="All Levels" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Ichtiandras &amp; Griušyte" Title="Easy Airsteps" Style="Lindy" Level="All Levels" />
          <Workshop Artist="Lizzie Abrahams" Title="Lindy" Style="Lindy" Level="Intermediate" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Simon &amp; Anna" Title="Lindy" Style="Lindy" Level="Int/Adv" />
          <Workshop Artist="Taina Kortelainen" Title="Lindy" Style="Lindy" Level="Beginner" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Simon &amp; Anna" Title="Lindy" Style="Lindy" Level="Intermediate" />
          <Workshop Artist="Taina Kortelainen" Title="20s Charleston" Style="Lindy" Level="All Levels" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Ichtiandras &amp; Griušyte" Title="Lindy" Style="Lindy" Level="Intermediate" />
          <Workshop Artist="Simon &amp; Anna" Title="Lindy" Style="Lindy" Level="Beginner" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Ichtiandras &amp; Griušyte" Title="Lindy" Style="Lindy" Level="Int/Adv" />
          <Workshop Artist="Lizzie Abrahams" Title="Shim Sham" Style="Lindy" Level="All Levels" />
        </Slot>
      </Room>
    </Day>
    <Day Date="2015-09-13">
      <Room Name="Reds">
        <Slot Time="10:00">
          <Workshop Artist="Mikko Kemppe" Title="Partnerwork On 2" Style="Salsa On2" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Cliff &amp; Miho" Title="Partnerwork On 2" Style="Salsa On2" />
          <Workshop Artist="YE Mambo" Title="Partnerwork On 2" Style="Salsa On2" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Lisa &amp; Mark" Title="Partnerwork On 2" Style="Salsa On2" />
          <Workshop Artist="Patrick Mussendijk" Title="Partnerwork On 2" Style="Salsa On2" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Fabian &amp; Esther" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Farid Ferchach" Title="Mens'' Shines" Style="Salsa On1" />
          <Workshop Artist="Joana Carvalho" Title="Ladies'' Shines" Style="Salsa On1" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Pierre &amp; Zoe" Title="Partnerwork with Tricks" Style="Salsa On1" />
          <Workshop Artist="Uriel &amp; Vera" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Fabian &amp; Esther" Title="Partnerwork On1" Style="Salsa On1" />
          <Workshop Artist="Sam Sleek" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
      </Room>
      <Room Name="Jaks">
        <Slot Time="10:00">
          <Workshop Artist="Fabian &amp; Nicolina" Title="Sensual Bachata" Style="Bachata" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Alex &amp; Ewelina" Title="Bachata Moderna" Style="Bachata" />
          <Workshop Artist="Uriel &amp; Vera" Title="Bachata Moderna" Style="Bachata" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Angus &amp; Ovgu" Title="Sensual Bachata" Style="Bachata" />
          <Workshop Artist="Gus &amp; Grace" Title="Sensual Bachata" Style="Bachata" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Ataca &amp; La Alemana" Title="Touch Bachata" Style="Bachata" Level="Advanced" />
          <Workshop Artist="Daniel &amp; Pebbles" Title="Bachata Moderna" Style="Bachata" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Fabian &amp; Nicolina" Title="Sensual Bachata" Style="Bachata" />
          <Workshop Artist="Simon &amp; Natalie" Title="Bachata Moderna" Style="Bachata" Level="Intermediate" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Amanda Hawley" Title="Dominican Bachata" Style="Bachata" />
          <Workshop Artist="Richard &amp; Dani-Leigh" Title="Dominican Fusion" Style="Bachata" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Pierre Henry" Title="Social Bachata" Style="Bachata" />
          <Workshop Artist="Sol &amp; Laura" Title="Sensual Bachata" Style="Bachata" />
        </Slot>
      </Room>
      <Room Name="Yacht">
        <Slot Time="10:00" />
        <Slot Time="11:00" />
        <Slot Time="12:00">
          <Workshop Title="To be scheduled" Style="Other" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Moe Flex" Title="La Rueda" Style="Cuban Salsa" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Misael" Title="Cuban Partnerwork" Style="Cuban Salsa" Level="Intermediate" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Leo Henriquez" Title="Cuban Partnerwork" Style="Cuban Salsa" />
        </Slot>
        <Slot Time="17:30" />
      </Room>
      <Room Name="Princes">
        <Slot Time="10:00">
          <Workshop Artist="Marchant &amp; Davina" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Farid Ferchach" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Fadi K" Title="Partnerwork On1" Style="Salsa On1" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="YE Mambo" Title="Pachanga" Style="Salsa On2" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Patrick Mussendijk" Title="Partnerwork On2" Style="Salsa On2" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Moe Flex" Title="Funky Flex Moves" Style="Salsa On2" />
        </Slot>
        <Slot Time="17:30" />
      </Room>
      <Room Name="Lounge">
        <Slot Time="10:00">
          <Workshop Artist="Joao &amp; Giedre" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="David &amp; Adriana" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Riquita Alta" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Tony &amp; Sophie" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Nelson Campos" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Christian Jean-Francois" Title="Semba de Roda" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Joao &amp; Giedre" Title="Semba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
      </Room>
      <Room Name="Kent">
        <Slot Time="10:00">
          <Workshop Artist="Fabhiola &amp; Perry" Title="Cuban Partnerwork" Style="Cuban Salsa" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Title="Cuban Partnerwork" Style="Cuban Salsa" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Osbanis &amp; Aneta" Title="Rumba" Style="Cuban Salsa" />
        </Slot>
        <Slot Time="14:30" />
        <Slot Time="15:30">
          <Workshop Title="To be scheduled" Style="Other" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Riquita Alta" Title="Kizomba" Style="Kizomba &amp; Afro-Luso" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Mauro Casali" Title="Cha Cha" Style="Salsa On2" />
        </Slot>
      </Room>
      <Room Name="York">
        <Slot Time="10:00">
          <Workshop Artist="Joseph Davids" Title="Into to On2 (Part I)" Style="Salsa On2" Level="Beginner" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Joseph Davids" Title="Into to On2 (Part II)" Style="Salsa On2" Level="Beginner" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Sabine &amp; Saulo" Title="Cali Partnerwork" Style="Colombian Salsa" Level="Improver" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Nadia Yammine" Title="Kizomba (Part I)" Style="Kizomba &amp; Afro-Luso" Level="Beginner" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Nadia Yammine" Title="Kizomba (Part II)" Style="Kizomba &amp; Afro-Luso" Level="Beginner" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Sami &amp; Roxy" Title="Cali Tricks" Style="Colombian Salsa" Level="Int/Adv" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Luz Fernandez" Title="Cali Ladies Styling" Style="Colombian Salsa" Level="All Levels" />
        </Slot>
      </Room>
      <Room Name="Regency">
        <Slot Time="10:00">
          <Workshop Artist="Lizzie Abrahams" Title="Lindy" Style="Lindy" Level="Intermediate" />
          <Workshop Artist="Taina Kortelainen" Title="Lindy" Style="Lindy" Level="Beginner" />
        </Slot>
        <Slot Time="11:00">
          <Workshop Artist="Ichtiandras &amp; Griušyte" Title="Blackbottom" Style="Lindy" Level="All Levels" />
          <Workshop Artist="Simon &amp; Anna" Title="Lindy" Style="Lindy" Level="Int/Adv" />
        </Slot>
        <Slot Time="12:00">
          <Workshop Artist="Ichtiandras &amp; Griušyte" Title="Lindy" Style="Lindy" Level="Beginner" />
          <Workshop Artist="Lizzie Abrahams" Title="Shag" Style="Lindy" Level="All Levels" />
        </Slot>
        <Slot Time="14:30">
          <Workshop Artist="Simon &amp; Anna" Title="Lindy" Style="Lindy" Level="Intermediate" />
          <Workshop Artist="Taina Kortelainen" Title="Lindy" Style="Lindy" Level="Int/Adv" />
        </Slot>
        <Slot Time="15:30">
          <Workshop Artist="Lizzie Abrahams" Title="Lindy" Style="Lindy" Level="Beginner" />
          <Workshop Artist="Simon &amp; Anna" Title="Easy Airsteps" Style="Lindy" Level="All Levels" />
        </Slot>
        <Slot Time="16:30">
          <Workshop Artist="Ichtiandras &amp; Griušyte" Title="Lindy" Style="Lindy" Level="Beginner" />
          <Workshop Artist="Taina Kortelainen" Title="Lindy" Style="Lindy" Level="Intermediate" />
        </Slot>
        <Slot Time="17:30">
          <Workshop Artist="Lizzie Abrahams" Title="Lindy" Style="Lindy" Level="Int/Adv" />
          <Workshop Artist="Taina Kortelainen" Title="Jazz Roots" Style="Lindy" Level="All Levels" />
        </Slot>
      </Room>
    </Day>
  </Workshops>
</Event>'

BEGIN TRANSACTION

DECLARE @EventId INT

SELECT @EventId = [Id] FROM [Event] WHERE [Name] = @Import.value(N'/Event[1]/@Name', N'NVARCHAR(255)')

IF @EventId IS NULL BEGIN
 INSERT INTO [Event] ([Name], [StartDate], [EndDate])
	SELECT
	 [Name] = n.value(N'@Name', N'NVARCHAR(255)'),
		[StartDate] = n.value(N'@Start', N'DATE'),
		[EndDate] = n.value(N'@End', N'DATE')
	FROM @Import.nodes(N'/Event[1]') x (n)
	SET @EventId = SCOPE_IDENTITY()
END ELSE BEGIN
	DELETE [Workshop] WHERE [EventId] = @EventId
	DELETE [EventDate] WHERE [EventId] = @EventId
	DELETE [EventArtist] WHERE [EventId] = @EventId
END

;WITH [Data] AS (
		SELECT
			[Name] = n.value(N'@Name', N'NVARCHAR(100)'),
			[Workshops] = n.value(N'@Workshops', N'TINYINT')
		FROM @Import.nodes(N'/Event[1]/Artists[1]/Artist') x (n)
	)
INSERT INTO [Artist] ([Name])
SELECT d.[Name]
FROM [Data] d
 LEFT JOIN [Artist] a ON d.[Name] = a.[Name]
WHERE a.[Name] IS NULL

INSERT INTO [EventArtist] ([EventId], [Artist], [Workshops])
SELECT
 [EventId] = @EventId,
 [Artist] = n.value(N'@Name', N'NVARCHAR(100)'),
	[Workshops] = n.value(N'@Workshops', N'TINYINT')
FROM @Import.nodes(N'/Event[1]/Artists[1]/Artist') x (n)

INSERT INTO [EventDate] ([EventId], [Date], [StartDate], [EndDate])
SELECT
 [EventId] = @EventId,
	[Date] = n.value(N'@Date', N'DATE'),
	[StartDate] = n.value(N'../../@Start', N'DATE'),
	[EndDate] = n.value(N'../../@End', N'DATE')
FROM @Import.nodes(N'/Event[1]/Workshops[1]/Day') x (n)

INSERT INTO [EventDateRoom] ([EventId], [Date], [Room], [Sort])
SELECT
 [EventId] = @EventId,
	[Date] = n.value(N'../@Date', N'DATE'),
	[Room] = n.value(N'@Name', N'NVARCHAR(50)'),
	[Sort] = v.[number]
FROM [master]..[spt_values] v
 CROSS APPLY @Import.nodes(N'/Event[1]/Workshops[1]/Day/Room[sql:column("v.[number]")]') x (n)
WHERE v.[type] = N'P'
 AND v.[number] BETWEEN 1 AND 255
ORDER BY 1, 2, 4

INSERT INTO [EventDateTime] ([EventId], [Date], [Time])
SELECT DISTINCT
 [EventId] = @EventId,
	[Date] = n.value(N'../../@Date', N'DATE'),
	[Time] = n.value(N'@Time', N'TIME')
FROM @Import.nodes(N'/Event[1]/Workshops[1]/Day/Room/Slot') x (n)

INSERT INTO [Workshop] ([EventId], [Date], [Time], [Room], [Artist], [Title], [Style], [Level])
SELECT
 [EventId] = @EventId,
	[Date] = n.value(N'../../../@Date', N'DATE'),
	[Time] = n.value(N'../@Time', N'TIME'),
	[Room] = n.value(N'../../@Name', N'NVARCHAR(50)'),
	[Artist] = n.value(N'@Artist', N'NVARCHAR(100)'),
	[Title] = n.value(N'@Title', N'NVARCHAR(100)'),
	[Style] = n.value(N'@Style', N'NVARCHAR(50)'),
	[Level] = n.value(N'@Level', N'NVARCHAR(50)')
FROM @Import.nodes(N'/Event[1]/Workshops[1]/Day/Room/Slot/Workshop') x (n)

EXEC [apiWorkshopsExport] @EventId

COMMIT TRANSACTION

SELECT * FROM Event