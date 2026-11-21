# Praktické rady a tipy pro efektivní práci s AI

## 1. Přizpůsobte zadání svým zkušenostem

**Pokud jste zkušený vývojář nebo programátor:**

- Komunikujte s AI jako s dalším zkušeným vývojářem. Používejte přesnou odbornou terminologii a vyhýbejte se nejednoznačným formulacím.
- Určete, **čeho má být dosaženo a jakým způsobem má být řešení navrženo**, ale ponechte AI prostor pro vlastní rozhodnutí tam, kde není nutné předepisovat konkrétní implementaci.
- Uveďte architektonická omezení, rozhraní, požadované chování a technické požadavky. Nechte AI doptat se na chybějící informace.

**Pokud jste běžný uživatel nebo méně zkušený programátor:**

- Popište, čeho chcete dosáhnout, jak má výsledek vypadat a jaká omezení musí řešení respektovat. Způsob provedení nechte navrhnout AI.
- Požádejte AI o vytvoření dokumentu s požadavky a podmínkami řešení (Terms of Reference, ToR) ve formátu `.txt` nebo `.md`. Prostřednictvím dialogu jej postupně upřesňujte, dokud nebude přesně odpovídat vašim představám.
- Nechte si vysvětlit, jak AI vašemu zadání rozumí. Vysvětlení zkontrolujte, opravte případná nedorozumění a požádejte o objasnění všeho, čemu nerozumíte.

Pokud je nově vytvářené řešení nevyhovující, nebojte se je zahodit a začít znovu. Pokud je problém pouze v jedné části, požadujte její kompletní přepracování při explicitně požadovaném zachování zbytku funkčnosti. Například lze zcela změnit uživatelské rozhraní nebo způsob ovládání bez změny vlastní logiky aplikace.

Netrvejte na zachování každého detailu předchozí verze, pokud je nové řešení jako celek podstatně lepší.

## 2. Udržujte trvalý kontext projektu

Při zkrácení dlouhé konverzace může AI zachovat obecný přehled o projektu, ale ztratit podrobnosti jeho struktury, zavedené konvence, závislosti a rozhodnutí o implementaci.

Nespoléhejte proto pouze na historii konverzace. Vytvořte a udržujte několik souborů:

- **`AI.md` nebo `AI.txt`** – účel projektu, požadavky, aktuální stav, důležitá rozhodnutí, konvence a pokyny pro AI.
- **`TODO.md`** – nevyřešené úkoly, priority a průběh práce.
- **`CONVENTIONS.md` nebo část souboru `START_HERE.md`** – zavedená terminologie, názvy příkazů, opakovaně použitelné komponenty a architektonické konvence.
- **`AI_PRIVATE.txt` nebo soukromý adresář** – údaje specifické pro prostředí, například lokální cesty a adresy serverů. Tajemství uchovávejte odděleně a řádně je chraňte.

Požádejte AI, aby tyto soubory průběžně udržovala a načítala při zahájení nebo obnovení práce, případně při přechodu do nové konverzace. Pokud je to nutné, přiložte soubory výslovně nebo požadujte jejich načtení před pokračováním.

Citlivé údaje, zejména hesla, API klíče a autentizační tokeny, nevkládejte do běžných kontextových souborů ani do verzovacího systému Git. Při práci se servery SSH a rozhraními API upřednostňujte bezpečně spravované klíče nebo tokeny před předáváním hesel AI.

## 3. Pracujte podle strukturovaného postupu

Nespoléhejte pouze na neformální konverzaci. Požádejte AI, aby postupovala podle procesu odpovídajícího rozsahu úkolu:

**Analýza → Návrh → Plán → Návrh testů → Implementace → Ověření → Nasazení**

Tento postup má smysl i při úpravách existujícího řešení, byť jednotlivé fáze mohou být jednodušší.

- **Analýza:** Požádejte AI o prozkoumání stávající implementace, požadavků, závislostí a možných řešení.
- **Návrh:** Nechte ji zdokumentovat funkční a nefunkční požadavky, architekturu, bezpečnost, rozhraní a další omezení.
- **Plán:** Požadujte vytvoření `TODO.md` z požadavků a kontrolu každého úkolu vůči těmto požadavkům.
- **Návrh testů:** Nechte AI definovat odpovídající testy a očekávané výsledky před implementací nebo současně s ní.
- **Implementace:** Nechte ji zpracovávat jednotlivé ucelené úkoly a průběžně aktualizovat stav a kontext.
- **Ověření:** Vyžadujte provedení dostupných kontrol a zprávu o skutečných výsledcích.
- **Nasazení:** Pokud je potřeba, nechte AI nasadit správnou verzi a ověřit, že skutečně běží zamýšlená instance.

Vy sami kontrolujte požadavky a plán. AI vám může pomoci s jejich formulací, ale odpovídáte za rozhodnutí, zda skutečně vystihují vaše záměry.

Veďte dokumentaci projektu i tehdy, když s AI řešíte pouze jeho část. Díky tomu můžete snáze začít znovu, změnit směr nebo nahradit příliš komplikované řešení, aniž byste ztratili původní požadavky.

## 4. Nejprve posuzujte logiku, potom detaily

Požádejte AI, aby vysvětlila, jak její řešení funguje a jak upravené komponenty souvisejí se zbytkem projektu.

Prověřte, zda řešení skutečně odstraňuje problém, respektuje architekturu, zachovává stávající funkčnost a počítá s relevantními chybovými stavy.

Nejprve se zaměřte na celkovou logiku a strukturu. Drobné formátovací, názvoslovné a stylistické nedostatky řešte až po odstranění podstatných problémů.

Přesvědčivé vysvětlení nepovažujte za důkaz správnosti. Požádejte AI o ověření implementace kompilací, spuštěním a odpovídajícími testy.

U malých komponent bývá rychlá kontrola architektury užitečnější než opakované dolaďování jednotlivých funkcí. Zvláštní pozornost věnujte širším souvislostem, ve kterých AI často chybuje.

## 5. Zachovávejte existující struktury a konvence

Častou chybou je vytváření nového řešení namísto rozšíření toho, které již existuje. Tento problém často souvisí se ztrátou podrobného kontextu během dlouhé konverzace.

Udržujte přehled zavedených příkazů, funkcí, metod, komponent a dalších opakovaně použitelných prvků. Požadujte, aby je AI před zavedením nových struktur prověřila.

Formulujte zadání jako konkrétní omezení, například:

- „Rozšiř existující X tak, aby podporoval také Y.“
- „Než navrhneš nové řešení, vyhledej existující implementaci.“
- „Zachovej současný formát vstupu a uprav parser, nikoli vstupní data.“
- „Zjisti, odkud se tato metoda volá a které komponenty závisejí na jejím chování.“

Před významnějšími změnami nechte AI prozkoumat relevantní soubory a vysvětlit jejich vzájemné vztahy.

Slova „přidej“, „rozšiř“ nebo „vytvoř“ automaticky neznamenají „všechno vytvoř od začátku“. Související existující komponenty je třeba nejprve analyzovat a podle potřeby znovu použít nebo rozšířit. Nový kód má být odůvodněn požadavky a architekturou, nikoli ztrátou kontextu.

## 6. Předcházejte chybám při implementaci a nasazení

Požadujte, aby AI průběžně ověřovala následující skutečnosti:

- **Správné cíle:** Ověřte zdrojové soubory, výstup sestavení, cílový adresář, umístění běžící aplikace, URL nebo cestu UNC. Správná kompilace nepomůže, pokud se spouští nesprávný program.
- **Konzistentní umístění:** Neměňte mezi iteracemi cílové cesty bez důvodu a neponechávejte několik konkurenčních zastaralých verzí.
- **Minimální změny:** Upřednostňujte úpravu existujícího kódu před zbytečným vytvářením nových skriptů a nástrojů.
- **Řízený úklid:** Odstraňujte dočasné testovací a pomocné skripty, jakmile nejsou potřeba. Užitečnou automatizaci pro sestavování, testování a nasazování zachovávejte a organizujte.
- **Omezení pevných hodnot:** Pro údaje závislé na prostředí používejte konfiguraci nebo parametry, například pro cesty, názvy souborů, místní nastavení, desetinné oddělovače a popisky rozhraní.
- **Dodržení rozsahu:** Měňte pouze požadovanou funkčnost a přímo související komponenty. Nesouvisející kód, data a texty zachovávejte, kde je to požadováno, přesně.
- **Správa procesů:** V případě potřeby ukončete zastaralé nebo zaseknuté procesy, nahraďte správnou běžící verzi a ověřte její spuštění.

Vyhněte se rozsáhlým univerzálním skriptům, pokud jsou bezpečnější přesné dílčí úpravy. Požadujte použití vhodných nástrojů pro editaci souborů nebo operací MCP, jsou-li dostupné. U příkazového řádku vyžadujte pečlivé ošetření uvozovek, apostrofů, zpětných lomítek, znaku `@` a vnořených řetězců.

Navrhované mazání a významné změny kontrolujte sami, zejména pokud mohou odstranit užitečnou automatizaci nebo ovlivnit nesouvisející funkčnost.

## 7. Vyžadujte skutečné ověření

**Nejnebezpečnější je situace, kdy vše vypadá správně, ale nikdo to skutečně neověřil.**

Požádejte AI, aby po každé změně kódu provedla relevantní kontroly, pokud výslovně neomezíte rozsah úkolu nebo to prostředí neumožňuje:

1. Zkontrolovat syntaxi a strukturální správnost.
2. Zkompilovat nebo sestavit dotčené komponenty.
3. Spustit aplikaci nebo odpovídající ladicí postup.
4. Provést funkční testy.
5. Spustit regresní testy ověřující zachování dosavadní funkčnosti.
6. Podle potřeby ověřit nasazení a běžící verzi.
7. Podle potřeby aktualizovat a ověřit distribuční balíček, instalační programy a instalační skripty.

U složitějších projektů požadujte odpovídající jednotkové, integrační a UI/UX testy. U jednoduchého skriptu bez testovací sady může postačovat cílený ruční test.

Požádejte AI, aby aktualizovala testy, které již nepokrývají změněné chování. Vyžadujte kontrolu výstupů příkazů, chyb a varování a zprávu o tom, co bylo skutečně otestováno, co prošlo, co selhalo a co zůstalo neověřené.

Samotné tvrzení „implementace byla úspěšně dokončena“ není důkaz. Ani nulový návratový kód nemusí znamenat, že operace skutečně uspěla. Aplikace mohla selhat bez zjevné chyby, vytvořit neúplný výstup nebo pracovat s nesprávným cílem.

Vy sami posuďte, zda předložené důkazy dostatečně prokazují správnost vzhledem k významu daného úkolu.

## 8. Vyžadujte důsledné ošetření chyb

Požádejte AI, aby vyhodnotila možné způsoby selhání příkazů, operací, rozhraní API a nástrojů MCP. Očekávané chyby musí být ošetřeny, nikoli skryty.

Implementace má rozlišovat mezi nepodstatným selháním dílčí operace a chybou, která znemožňuje splnění celého úkolu. Vyžadujte užitečné diagnostické informace prostřednictvím chybových hlášení, varování, návratových hodnot nebo protokolů.

U nástrojů MCP a rozhraní API požadujte jednotný způsob hlášení chyb. Neúspěšná operace nesmí vracet výsledek, který vypadá jako úspěšný. U vzdáleně provozovaných služeb mají citlivé diagnostické údaje zůstat v chráněných protokolech; podle potřeby lze předat identifikátor korelace.

Nechte AI testovat nejen úspěšné průběhy, ale také chybové scénáře, včetně případů, kdy operace selže bez zjevného chybového kódu.

## 9. Používejte nástroje MCP a pracovní prostředí účelně

AI agenti někdy volí zbytečně komplikované postupy nebo nesprávně používají dostupné nástroje.

Požádejte AI, aby volila nejpřímější, nejpřesnější a nejvhodnější dostupnou operaci:

- Upřednostňujte cílené nástroje pro úpravy souborů před složitými obchvatnými postupy v příkazovém řádku, pokud jsou vhodné.
- Stanovte jasný postup pro kopírování zdrojových souborů do pracovního prostředí, jejich úpravu a vrácení na správné místo.
- Pokud cílené hledání selže, rozšiřte je namísto dalšího odhadování. Podle potřeby použijte příkazy `ls`, `dir` nebo vhodné zástupné znaky.
- Nechte AI analyzovat a filtrovat širší výsledky hledání namísto zahlcování kontextu nepotřebnými výpisy.
- Vyžadujte ověření skutečných možností a dokumentovaných rozhraní nástrojů MCP místo improvizace s nepodporovanými operacemi.

Cílem není za každou cenu minimalizovat počet příkazů, ale dosahovat přesných, kontrolovatelných a spolehlivých výsledků s co nejmenší zbytečnou složitostí.

## 10. Přerušte opakování stejných chyb

Pokud AI opakovaně vytváří stejný chybný výsledek, pouhé přeformulování zadání pravděpodobně nepomůže.

Zastavte dosavadní postup a požádejte AI, aby vysvětlila své předpoklady, určila příčinu chyby a znovu vyhodnotila dostupné důkazy.

Požadujte minimální reprodukovatelný test, ověření hypotézy, která by mohla vyvrátit dosavadní závěr, nebo prověření konkrétního scénáře selhání. Užitečné mohou být také bezpečnostní testy a hypotetické scénáře, pokud vedou ke konkrétnímu ověření.

Pokud je přístup zásadně chybný, požadujte alternativní řešení nebo novou implementaci vycházející z původních požadavků.

Poskytujte přímou zpětnou vazbu, ale vždy vysvětlete, co je špatně a proč. Například:

- „Stop. Měníš nesprávnou komponentu. Je třeba opravit parser a zachovat stávající vstupní rozhraní.“
- „Opakuješ stejný postup navzdory výsledkům testů. Přehodnoť své předpoklady a navrhni jiné vysvětlení.“
- „Sestavení proběhlo úspěšně, ale aplikace stále používá starý program. Ověř cesty nasazení a běžící instance.“

Nedovolte, aby se práce změnila v nekonečný cyklus neověřených oprav. V případě potřeby požádejte AI o shrnutí důkazů a nové posouzení problému od začátku.

## 11. Využijte roli ďáblova advokáta a nezávislého hodnotitele

U složitých rozhodnutí požádejte AI, aby zastávala dvě odlišné role.

Nejprve ji nechte působit jako **ďáblův advokát**, který váš návrh zpochybní pomocí co nejsilnějších rozumných protiargumentů, rizik, slabin a alternativ.

Poté požádejte AI, aby vystupovala jako **nezávislý hodnotitel nebo prostředník**. Má posoudit obě strany, rozlišit ověřitelná fakta od předpokladů a subjektivních preferencí a doporučit nejlepší řešení nebo kompromis.

Lidské faktory, například použitelnost, pocity a mezilidské důsledky, mohou být relevantními argumenty, ale musí být odlišeny od objektivních skutečností.

Cílem je odhalit slabiny před přijetím rozhodnutí. Konečné rozhodnutí zůstává na vás.

## 12. Vytvářejte opakovatelné pokyny pro pravidelné úkoly

Pokud AI pravidelně zadáváte podobné úkoly, vytvořte pro ně samostatné instrukční soubory.

Například pokyny pro tvorbu dokumentace mohou určovat požadovaný formát, rozsah, konvence a cílové umístění výsledných souborů.

Požádejte AI, aby pokyny průběžně vylepšovala, pokud zjistíte opakující se chyby nebo opomenutí. Pomocí klíčových slov nebo krátkého popisu určete, které instrukce se mají použít.

Opakovatelné pokyny oddělujte od aktuálního stavu projektu: první popisují, jak úkol provést, druhý popisuje, co již existuje a jaká omezení platí.

## 13. Poskytujte přesnou zpětnou vazbu a zachovejte si kontrolu

Pokud AI nesprávně pochopí požadavky, ignoruje omezení nebo opakuje chyby, řekněte jí to přímo. Vysvětlete problém a určete požadovanou nápravu.

Například:

- „Nevytvářej další příkaz. Prohledej existující strukturu příkazů a rozšiř zavedenou implementaci.“
- „Upravil jsi nesouvisející soubory. Vrať tyto změny a omez implementaci na požadovaný rozsah.“
- „Příkaz skončil úspěšně, ale očekávaný výsledek chybí. Než budeš pokračovat, prověř skutečný výstup.“

Pokud AI opakovaně porušuje stejné podmínky, požádejte ji, aby před pokračováním znovu potvrdila relevantní omezení.

Nespokojenost vyjádřete podle potřeby, ale podložte ji důkazy a jasným zdůvodněním. Konkrétní zpětná vazba je mnohem užitečnější než samotný hněv.

## 14. Praktický kontrolní seznam pro každou iteraci

Požádejte AI, aby před označením úkolu za dokončený potvrdila následující skutečnosti:

- Načetla aktuální požadavky a kontext projektu.
- Prověřila existující implementace a závislosti.
- Provedla požadované změny bez zbytečného vytváření nových řešení.
- Zachovala nesouvisející funkčnost a obsah.
- Zkontrolovala syntaxi, sestavení, spuštění a relevantní testy.
- Prohlédla chyby, varování a výstupy příkazů.
- Podle potřeby ověřila správný cíl nasazení a běžící verzi.
- Odstranila dočasné soubory a nepotřebné procesy a zachovala užitečnou automatizaci.
- Aktualizovala kontextové soubory, TODO a záznamy o průběhu práce.
- Zdokumentovala zbývající omezení a neověřené předpoklady.

Toto potvrzení sami zkontrolujte. Kontroly přizpůsobte konkrétnímu úkolu a požadujte vysvětlení, pokud byla některá důležitá kontrola vynechána.

---

## Základní princip

Považujte AI za schopného, ale nedokonalého spolupracovníka. Požadujte, aby analyzovala, navrhovala, implementovala, vysvětlovala a testovala. Poskytněte jí dostatek kontextu, aby zachovala to, co již funguje, a vyžadujte důkazy, pokud tvrdí, že úkol úspěšně dokončila.

Vaší odpovědností je určit požadovaný výsledek, kontrolovat požadavky a důležitá rozhodnutí, zpochybňovat chybné předpoklady a posoudit, zda předložené důkazy dostatečně potvrzují správnost výsledku.

Cílem není kontrolovat každý řádek kódu. Cílem je vytvořit opakovatelný pracovní postup, v němž AI rozumí tomu, čeho má dosáhnout, provádí cílené změny, zachovává existující funkčnost a prokazuje, že výsledek splňuje stanovené požadavky.