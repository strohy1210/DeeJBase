# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'


#
# Dj.create([{name: 'Strohberry', bio: 'born and bred in the great state of NY'},])
# events = Event.create()
Venue.create(JSON.parse('[{"name":"1 Front","address":"One Front Street; Brooklyn, NY 11248"},{"name":"107 Suffolk","address":"107 Suffolk St; NY 10002"},{"name":"116","address":"116 MacDougal Street, Greenwich Village; NY 10012"},{"name":"12-turn-13","address":"172 Classon Avenue; Brooklyn, NY 11205"},{"name":"171 Lombardy","address":"171 Lombardy Street; Brooklyn, NY 11222"},{"name":"200 Orchard Bar","address":"200 Orchard Street; NY 10002"},{"name":"285 Kent","address":"285 Kent Ave, Brooklyn, NY, 11211"},{"name":"319 Scholes","address":"319 Scholes Street; Brooklyn, NY 11206"},{"name":"3rd Ward","address":"195 Morgan Avenue; Brooklyn, NY 11237"},{"name":"5 Ninth","address":"5 Ninth Avenue; NY 10014"},{"name":"88 Palace","address":"88 East Broadway; NY 10002"},{"name":"Ace Hotel","address":"20 W. 29th St. NY 10001"},{"name":"The Actor\'s Playhouse","address":"100 7th Ave South NY 10014"},{"name":"Affaire","address":"50 Avenue B; NY 10009"},{"name":"AK Lounge","address":"710 Amsterdam Avenue; NY 10025"},{"name":"Alibi","address":"116 Macdougal St; NY 10012"},{"name":"Alphabet Lounge","address":"104 Avenue C; NY 10009"},{"name":"American Museum Of Natural History","address":"Central Park West 79th Street; NY 10024"},{"name":"Amnesia NYC","address":"609 West 29th Street; NY 10001"},{"name":"Andaz Wall Street","address":"75 Wall Street, NY 10005"},{"name":"The Angelica Film Center","address":"18 West Houston Street; NY 10012"},{"name":"Aqua","address":"291 Hooper Street; Brooklyn, NY 11211"},{"name":"Area","address":"32-02 Farrington Street; Flushing, NY 11354"},{"name":"Arena","address":"135 West 41st Street; NY 10036"},{"name":"Arka Lounge","address":"4488 Broadway, 10040"},{"name":"Arlene\'s Grocery","address":"95 Stanton Street; NY 10002"},{"name":"Ars Nova","address":"511 West 54 Street; NY 10019"},{"name":"Aspen Social","address":"157 W 47th St, NY 10036"},{"name":"The Attic Rooftop","address":"251 W 48th St, Hilton Garden Inn Times Square, 16th floor, NY 10036"},{"name":"Avion","address":"1949 McDonald Avenue; Brooklyn, NY 11223"},{"name":"B Bar","address":"40 East 4th Street; NY 10003"},{"name":"B.East","address":"171 East Broadway; NY 10002"},{"name":"Babalu","address":"3233 E Tremont Ave, NY 10461"},{"name":"Babel Lounge & Hookah Bar","address":"131 Avenue C; NY 10009"},{"name":"Baby\'s All Right","address":"146 Broadway Brooklyn, NY"},{"name":"Bar 13","address":"35 East 13th Street; NY 10003"},{"name":"The Bar Downstairs","address":"485 5th Avenue, Manhattan, NY 10018"},{"name":"Bar On A","address":"170 Avenue A; NY 10009"},{"name":"Baryshnikov Arts Center","address":"450 West 37th Street, Suite 501; NY 10018"},{"name":"Battery Harris","address":"64 Frost Street, Brooklin, NY"},{"name":"Beauty Bar","address":"231 East 14th Street, NY 10003"},{"name":"Beauty Bar Brooklyn","address":"921 Broadway; Brooklyn, NY 11206"},{"name":"Bedlam Bar And Lounge","address":"40 Avenue C; NY 10009"},{"name":"Beekman Beach Club","address":"89 South St; City, NY 10038; USA"},{"name":"The Bell House","address":"149 7th Street; Brooklyn, NY 11215"},{"name":"Bembe","address":"81 S. 6th St, Brooklyn, NY 11211"},{"name":"Best Buy Theater","address":"1515 Broadway; NY 10036"},{"name":"Big Six","address":"97 Bowery; NY 10002"},{"name":"Bistrouge","address":"432 East 13th Street; NY 10019"},{"name":"Bizarre Bushwick / Bizarre Bar","address":"12 Jefferson Street, Brooklyn, NY 11206"},{"name":"Blue Lounge","address":"45-01 Northern Blvd; Long Island City, NY 11101"},{"name":"The Blue Owl","address":"196 2nd Ave., NY, 10003"},{"name":"Bona Fides","address":"60 2nd Avenue; NY 10003"},{"name":"Boogaloo","address":"168 Marcy Avenue; Brooklyn, NY 11211"},{"name":"Boom Lounge","address":"152 Spring Street; NY 10012"},{"name":"Bossa Nova Civic Club","address":"1271 Myrtle Ave; Brooklyn, NY 11221"},{"name":"Botanica","address":"47 E Houston St., NY 10012, USA"},{"name":"Bowery Ballroom","address":"6 Delancey Street; NY 10002"},{"name":"The Bowery Electric","address":"327 Bowery, NY 10003"},{"name":"The Bowery Poetry Club","address":"308 Bowery Street; NY 10012"},{"name":"Broadway East","address":"171 East Broadway; NY 10002"},{"name":"Brooklyn Academy Of Music/Bamcafe","address":"30 Lafayette Avenue; Brooklyn, NY 11243"},{"name":"Brooklyn Bowl","address":"61 Wythe Avenue; Brooklyn, NY 11211"},{"name":"Brooklyn Fireproof","address":"119 Ingraham Street; Brooklyn, NY 11237"},{"name":"Brooklyn Masonic Temple","address":"317 Clermont Avenue; Brooklyn, NY 11205"},{"name":"Brooklyn Sky Deck","address":"289 Kent Avenue; Brooklyn, NY 11211"},{"name":"Brooklyn Stable","address":"486 Metropolitan Ave, Brooklyn, NY 11211"},{"name":"Brooklyn Winery","address":"213 N. 8th St., Brooklyn, NY 11211"},{"name":"Brownstone Hall","address":"556 West 57th street; NY 10019"},{"name":"The Bruckner","address":"1 Bruckner Blvd; Bronx, NY 10454"},{"name":"Bungalo Lounge","address":"3203 Broadway; Queens, NY 11106"},{"name":"Bunga\'s Den","address":"137 West 14th Street; NY 10011"},{"name":"Butter","address":"415 Lafayette Street; NY 10003"},{"name":"Cake Shop","address":"152 Ludlow Street; NY 10002"},{"name":"Cameo Gallery","address":"93 North 6th Street; Brooklyn, NY 11211"},{"name":"Canal Room","address":"285 West Broadway & Canal; NY 10013"},{"name":"Canoe Place Inn","address":"239 E Montauk Hwy; Hampton Bays, NY 11946"},{"name":"Cantina Royal","address":"58 N 3rd St, Brooklyn, NY 11211"},{"name":"Carnegie Hall","address":"57th Street & 7th Avenue; NY 10019"},{"name":"Cellar Bar - Bryant Park Hotel","address":"40 West 40th Street; NY 10018"},{"name":"Censo Lounge","address":"31-84 33rd Street, Astoria, NY 11106"},{"name":"Central Park SummerStage","address":"830 Fifth Avenue; NY 10065"},{"name":"The Chelsea Room","address":"222 West 23rd Street; NY 10011"},{"name":"Chrystie 141","address":"141 Chrystie Street, NY 10002"},{"name":"Cielo","address":"18 Little West 12th Street; NY"},{"name":"Cienna","address":"2818 31st Street; Astoria, NY 11102"},{"name":"Circle Line Cruises","address":"West 42nd Street; NY 10011"},{"name":"Club 39","address":"303 West 39th Street, NY 10018"},{"name":"Club Allure","address":"33-02 Queens Blvd LIC, NY 11101"},{"name":"Club Rebel","address":"251 W. 30th street; NY 10001"},{"name":"Club Remix","address":"27 Park Place; NY 10007"},{"name":"Club Shelter","address":"37 Vandam St., 10013, NY"},{"name":"Cocktail Bodega Underground","address":"205 Chrystie Street, City, NY 10002"},{"name":"Coco66","address":"66 Greenpoint Avenue; Brooklyn, NY 11222"},{"name":"Coliseum","address":"15 South Broadway White Plains, NY 10601"},{"name":"Colors","address":"417 Lafayette Street, NY 10003"},{"name":"Concrete","address":"320 West 37th Street, NY 10018"},{"name":"Coney Island","address":"Coney Island, NY"},{"name":"Copacabana","address":"268 West 47th Street. Corner of 8th Ave., NY, 10036"},{"name":"Copia New York","address":"307 East 53rd St, NY 10022"},{"name":"Cosmoss","address":"450 87th Street; Brooklyn, NY 11209"},{"name":"Cotton","address":"105 west 27th street; NY 10001"},{"name":"The Counting Room","address":"44 Berry Street; Brooklyn, NY 11211"},{"name":"The Cove","address":"108 N 6th Street; Brooklyn, NY 11211"},{"name":"Covet Lounge","address":"137 East 55th Street; NY 10022"},{"name":"Crash Mansion","address":"199 Bowery, Spring Street; NY 10012"},{"name":"Crimson","address":"915 Broadway; NY 10010"},{"name":"CVZ Contemporary","address":"446 Broadway, 3rd Floor; NY 10013"},{"name":"Daisy Baker\'s","address":"33 2nd Street; Troy, NY 12180"},{"name":"Darkroom","address":"165 Ludlow St. NY 10002"},{"name":"Deep","address":"16 W 22nd Street; NY 10010"},{"name":"Deity","address":"368 Atlantic Avenue; NY 11217"},{"name":"Dekalb Market","address":"138 Willoughby Street; Brooklyn, NY 11201; USA"},{"name":"The Delancey","address":"168 Delancey Street; NY 10002"},{"name":"Devotion Gallery","address":"54 Maujer Street; Brooklyn, NY 11206"},{"name":"Dish","address":"9208 3rd Avenue; Brooklyn, NY 11209"},{"name":"DL","address":"95 Delancey Street, NY 10002"},{"name":"D-Lounge","address":"101 East 15th Street; NY 10003"},{"name":"Don Hill\'s","address":"511 Greenwich Street; NY 10013"},{"name":"D\'Or","address":"204 West 55th Street; NY 10019"},{"name":"Douglass Loft","address":"300 Douglass Loft; Brooklyn, NY 11217"},{"name":"Down House","address":"250 Avenue X Brooklyn, NY 11223"},{"name":"Drom","address":"85 Avenue A; NY 10009"},{"name":"Dubspot Theatre","address":"348 West 14th Street; NY"},{"name":"Duke\'s Bohemian Grove Bar","address":"253 Allen Street, Buffalo, NY"},{"name":"East River Bar","address":"97 South 6th Street; Brooklyn, NY 11211"},{"name":"East River Marina","address":"23rd Street & FDR Drive; NY 10010"},{"name":"East River Park Ampitheatre","address":"Lower East Side, NY 10002"},{"name":"Eden Lounge","address":"28 W 33rd St NY 10016, USA"},{"name":"Electric Warehouse","address":"1428 Fulton Street; Brooklyn, NY 11216"},{"name":"Element","address":"225 East Houston Street; NY 10009"},{"name":"Ella","address":"9 Avenue A; NY 10009"},{"name":"Empire Hotel Rooftop","address":"44 W 63rd Street, NY 10023, USA"},{"name":"Enid\'s","address":"560 Manhattan Avenue; Brooklyn, 11222"},{"name":"Europa Night Club","address":"98 Meserole Avenue; Brooklyn, NY 11222"},{"name":"Eyebeam","address":"540 West 21st Street; NY 10011"},{"name":"Faluka Lounge","address":"162 Bleecker Street; NY 10012"},{"name":"Fat Buddha Bar","address":"212 Avenue A, NY"},{"name":"The Fillmore New York At Irving Plaza","address":"17 Irving Place; NY 10003"},{"name":"Finding Sukha","address":"638 East 6th Street; NY 10009"},{"name":"The Flat","address":"308 Hooper Street; Williamsburg, Brooklyn, NY 11211"},{"name":"Flute Bar Gramercy","address":"40 East 20th Street; NY 10003"},{"name":"Fontana\'s","address":"105 Eldridge Street; NY 10002"},{"name":"Frank\'s Lounge","address":"660 Fulton Street; NY 11217"},{"name":"Freecandy","address":"905 Atlantic Avenue, Brooklyn, 11238"},{"name":"The Frying Pan","address":"Pier 63; NY"},{"name":"Fulton Loft","address":"70 Fulton St, NY 10038"},{"name":"The Fuse Box","address":"12 Central Avenue; Albany, NY 12210"},{"name":"Gabbana Restaurant & Lounge","address":"107-11 Northern Blvd, Corona, NY 11368"},{"name":"The Gallery At LPR","address":"158 Bleecker St; City, NY 10012"},{"name":"Gallery Bar","address":"120 Orchard Street; NY 10002"},{"name":"The Gallery","address":"293 Flatbush Avenue; NY 11217"},{"name":"Gibraltar Lounge","address":"20 Prince Street; NY 10012"},{"name":"Gin Palace","address":"95 Avenue A NY 10009"},{"name":"Glass","address":"287 10th Avenue; NY 10001"},{"name":"Glasslands Gallery","address":"289 Kent Avenue; Brooklyn, NY 11249"},{"name":"Glazz","address":"79-51 Albion Ave Queens; NY 11373"},{"name":"Goethe-Institut Wyoming Building","address":"5 East 3rd Street; NY 10003"},{"name":"Good Room","address":"98 Meserole Ave, Brooklyn, NY 11222"},{"name":"Governors Island","address":"Governors Island; NY 11201"},{"name":"Governor\'s Island Beach Club","address":"89 South St. NY"},{"name":"Gowanus Grove","address":"400 Caroll Street; Brooklyn, NY 11231"},{"name":"Grace Hotel","address":"125 West 45th Street #1; NY 10036"},{"name":"The Graham","address":"151 Mesesrole St. NY 11206"},{"name":"Green Room","address":"286 Spring Street; NY 10013"},{"name":"Greenhouse","address":"150 Varick Street; NY 10013"},{"name":"Griffin","address":"50 Gansevoort St, Manhattan, NY 10014"},{"name":"Guggenheim Museum","address":"1071 Fifth Avenue; NY 10128"},{"name":"Gun Bar","address":"55 Gansevoort Street, NY 10014"},{"name":"Gypsy Tea","address":"33 West 24th Street; NY 10011"},{"name":"H.m.s. Half Moon","address":"Skyport Marina; 23rd Street & East River; NY 10010"},{"name":"Halcyon The Shop","address":"57 Pearl Street; Brooklyn, NY 11201"},{"name":"Hammerstein Ballroom","address":"311 West 34th Street; NY 10001"},{"name":"Harbor Lights Yacht","address":"East 23rd Street & FDR Drive, NY 10010"},{"name":"Haus","address":"285 West Broadway"},{"name":"Haven","address":"244 East 51st Street; NY 10022"},{"name":"Hb (Aka Hook)","address":"18 Commerce St; Brooklyn, NY 11231"},{"name":"Heathers","address":"506 East 13th Street; NY 10009"},{"name":"Hello Brooklyn","address":"18 Commerce Street; Brooklyn, NY 11231"},{"name":"Henrietta Hudson","address":"438 Hudson Street; NY 10014"},{"name":"Hibachi Tiki Hut","address":"890 Broadway; NY 11206"},{"name":"Highline Ballroom","address":"431 West 16th Street; NY 10011"},{"name":"Hiro Ballroom","address":"363 West 16th Street; NY 10011"},{"name":"HK Lounge","address":"405 W 39th Street; NY 10018"},{"name":"Home Sweet Home","address":"131 Chrystie Street; NY 10002"},{"name":"Hope Lounge","address":"10 Hope Street; Brooklyn, NY 11211"},{"name":"Hotel Chantelle","address":"92 Ludlow St; NY 10002"},{"name":"Hotel on Rivington - CO-OP Lounge","address":"107 Rivington Street, bet. Ludlow & Essex, NY 10002"},{"name":"House Of Yes","address":"342 Maujer Street; Brooklyn, NY 11206"},{"name":"Hudson Bar","address":"356 W 58 Street; NY 10019"},{"name":"Hudson Hotel","address":"356 West 58th Street; NY 10019"},{"name":"Hudson River Cafe","address":"697 West 133rd Street; NY 10027"},{"name":"Hudson Terrace","address":"621 West 46th Street; NY 10036"},{"name":"The Hype Central Entertainment Complex","address":"525 Waverly Ave, Brooklyn, NY 11238, USA"},{"name":"Ico Art And Music Gallery","address":"606 West 26 Street; NY 10001"},{"name":"Identity","address":"511 East 6th Street; NY 10003"},{"name":"Inc Lounge","address":"224 West 49th Street (2nd floor) NY 10019"},{"name":"Indiescreen","address":"285 Kent Avenue at S 2nd Street, Williamsburg Brooklyn 11211"},{"name":"Industry City","address":"220 36th Street, Brooklyn, NY 11232, USA"},{"name":"Irving Plaza","address":"17 Irving Place; NY 10003"},{"name":"Issue Project Room","address":"22 Boerum Place, Brooklyn"},{"name":"Itremerli","address":"463 West Broadway, City; NY"},{"name":"Jamaica Performing Arts Center","address":"153-10 Jamaica Avenue, Jamaica, 11432"},{"name":"Jelani","address":"507 Waverley Avenue; Brooklyn, NY 11238"},{"name":"Jewel Yacht","address":"East 23rd St & FDR Drive NY 10010"},{"name":"The Juilliard School - Paul Hall","address":"155 W. 65th Street, NY 10023"},{"name":"Jungle","address":"Brooklyn, NY"},{"name":"K Lounge","address":"30 West 52nd Street; NY 10019"},{"name":"Kabin Bar And Lounge","address":"92 2nd Ave NY 10003, NY, USA"},{"name":"Karma Hookah Lounge","address":"51 1st Avenue; NY 10003"},{"name":"Katra","address":"217 Bowery; NY 10002"},{"name":"Keybar","address":"432 East 13th Street; NY 10009"},{"name":"Keyspan Park, Brooklyn, Ny","address":"1904 Surf Avenue; Brooklyn, NY 11224"},{"name":"Kinfolk 94","address":"94 Wythe Ave, Brooklyn, 11211"},{"name":"Kinfolk Studios","address":"90 Wythe Ave. Brooklyn, NY 11211"},{"name":"King & Grove Williamsburg","address":"160 North 12th Street"},{"name":"King\'s Cross","address":"356 Bowery, NY 10012"},{"name":"Kiss & Fly","address":"409 West 13th Street; NY 10014"},{"name":"Knitting Factory","address":"361 Metropolitan Avenue; Brooklyn, NY 11211"},{"name":"Kush Lounge","address":"191 Chrystie Street; NY 10002"},{"name":"La Boheme Lounge","address":"1790 Stillwell Avenue; Brooklyn, NY 11223"},{"name":"La Lune","address":"103 Avenue A ( Between 6 St & 7 St ) NY 10009"},{"name":"La Marina","address":"348 Dyckman Street"},{"name":"La Pomme","address":"37 West 26th Street; NY 10010"},{"name":"La Vie","address":"64 East 1st Street; NY 10003"},{"name":"La Zarza","address":"166 First Avenue; NY 10009"},{"name":"Lavo New York","address":"39 East 58th Street; NY 10022"},{"name":"Le Bain","address":"848 Washington Street; NY 10014"},{"name":"Le Bain at The Standard","address":"444 W. 13th St. NY 10014"},{"name":"Le Baron","address":"32 Mulberry Street, NY 10013"},{"name":"Le Caire Lounge","address":"189 East 3rd Street; NY 10009"},{"name":"Le Lupanar","address":"103 Essex Street; NY 10002"},{"name":"Le Poisson Rouge","address":"158 Bleecker Street; NY 10012"},{"name":"Le Souk Harem","address":"510 Laguardia Place; NY 10012"},{"name":"Leather Lounge","address":"454 West 128 Street; NY 10027"},{"name":"Leftfield","address":"87 Ludlow Street between Broome & Delancey"},{"name":"LeSouk","address":"47 Avenue B; NY 10009"},{"name":"Level 3","address":"605 W.48th St. NY 10036"},{"name":"Lexicon NYC","address":"226 east 54th street; NY 10022"},{"name":"Libation","address":"137 Ludlow Street; NY 10002"},{"name":"Liberty Theater","address":"234 West 41st Street, NY"},{"name":"Lilium","address":"201 Park Ave South, Union Square, N.Y. 10019"},{"name":"Lincoln Center","address":"1881 Broadway; NY 10023"},{"name":"Liquid Vibe","address":"45-01 Northern Boulevard; Queens, NY 11101"},{"name":"Lit Lounge","address":"93 2nd Ave, , 10003"},{"name":"Littlefield","address":"622 Degraw Street; Brooklyn, NY 11217"},{"name":"The Living Room","address":"154 Ludlow Street; NY 10002"},{"name":"Local West","address":"8th Ave & West 33rd Street; NY 10001"},{"name":"The Loft","address":"142 Mill Road; Westhampton, NY 11978"},{"name":"Loreley","address":"64 Frost Street; ; NY 11211"},{"name":"Lot 45","address":"411 Troutman St, Brooklyn NY 11237"},{"name":"Louie and Chan","address":"303 Broome St, NY 10002"},{"name":"Low Bar","address":"81 Washington Street; Brooklyn, NY 11201"},{"name":"LP & Harmony","address":"683 Grand St, Brooklyn, NY 11211"},{"name":"LQ NYC","address":"511 Lexngton Avenue,, NY 10017"},{"name":"M Bar","address":"349 Broome Street; NY 10013"},{"name":"M1-5","address":"52 Walker Street; NY 10013"},{"name":"Mach 8 NYC","address":"179 Macdougal St"},{"name":"Madame X","address":"94 West Houston Street; NY 10012"},{"name":"Madison Square Garden","address":"4 Pennsylvania Plaza; NY 10001"},{"name":"Mantra Lounge","address":"986 2nd Avenue; NY 10022"},{"name":"Marquee","address":"289 Tenth Avenue; NY 10001"},{"name":"Maximus Lounge","address":"36-11 30th Avenue; Astoria, NY 11103"},{"name":"McCarren Park Pool","address":"475 Leonard St; Brooklyn, NY 11222"},{"name":"The Mean Fiddler","address":"266 West 47th Street; NY 10036"},{"name":"Melrose Ballroom","address":"36-08 33rd st. Astoria, NY 11106"},{"name":"The Mercury Lounge","address":"217 East Houston Street; NY 10002"},{"name":"Merkin Concert Hall","address":"129 West 67th Street, NY 10023"},{"name":"Miknic Lounge","address":"200 Columbia Street; Brooklyn, NY 11231"},{"name":"Miller Theatre","address":"2960 Broadway; NY 10027"},{"name":"Miss Buffalo","address":"430 Erie St; Buffalo, NY 14202"},{"name":"Miss Lily\'s","address":"132 W. Houston Street, NY, 10012"},{"name":"Mister H","address":"9 Crosby St, NY 10013"},{"name":"MObar","address":"80 Columbus Circle; NY 10023"},{"name":"Mocca Lounge","address":"78 Reade Street; NY 10007"},{"name":"Moe\'s Bar And Lounge","address":"80 Lafeyete; Brooklyn, NY 11233"},{"name":"MoMA","address":"11 West 53rd Street; NY 10019"},{"name":"MoMA PS1","address":"22-25 Jackson Avenue; Long Island City, NY 11101"},{"name":"The Monster","address":"80 Grove Street; NY 10014"},{"name":"Motivo","address":"915 Broadway, NY 10010"},{"name":"Muchmore\'s","address":"2 Havemeyer St., Brooklyn, NY 11211"},{"name":"Mulberry Project","address":"149 Mulberry St., NYC"},{"name":"Mulligan\'s","address":"6 Round Lake Rd, Ballston Lake, NY 12309"},{"name":"Music Hall of Williamsburg","address":"66 North 6th Street; NY 11211"},{"name":"Natsumi","address":"226 West 50th Street; NY 10019"},{"name":"Nello Summertimes","address":"136 Main St; Southampton, NY"},{"name":"Neptunes","address":"70 Dune Road; Quogue, NY 11959"},{"name":"Nexus Lounge","address":"76 East 1st Street; NY 10009"},{"name":"No Fun","address":"161 Ludlow Street"},{"name":"No Malice Palace","address":"197 East 3rd Street; NY 10009"},{"name":"Nokia Theater","address":"1515 Broadway, NY"},{"name":"North Fourth","address":"160 - 2 N 4th St, Brooklyn, NY 11211"},{"name":"Novecento","address":"343 West Broadway; NY 10013"},{"name":"Nublu","address":"56 Avenue C, Ground Floor; NY 10009"},{"name":"Nuyorican Poets Cafe","address":"236 East 3rd Street; NY 10009"},{"name":"Odyssea","address":"486 Metropolitan Avenue; Brooklyn, NY 11211"},{"name":"OfficeOps","address":"57 Thames Street; Brooklyn, NY 11237"},{"name":"Ohm Ultra Lounge","address":"948 Main Street; Buffalo, NY 14202"},{"name":"Old American Can Factory","address":"232 Third Street; Brooklyn, NY 11215"},{"name":"Olivia","address":"1073 Atlantic Avenue, Brooklyn, NY, 11238, USA"},{"name":"One Last Shag","address":"348 Franklin Ave, Brooklyn, NY 11238"},{"name":"Open House","address":"244 E Houston St NY 10002, USA"},{"name":"Oragin","address":"1815 Route 110; Farmingdale, NY 11765"},{"name":"Output","address":"74 Wythe Avenue, Brooklyn, 11201"},{"name":"Pacha NYC","address":"618 W. 46th Street, NY 10036"},{"name":"Pacha NYC Basement","address":"618 West 46th Street, Lower Level; NY 10036"},{"name":"Pachita","address":"618 W 46th St; NY"},{"name":"Paddle Wheel Queen","address":"2430 FDR Drive; NY 10010"},{"name":"Palladium","address":"36-14 31st Street, Astoria, 11106"},{"name":"The Palms","address":"26-01 Jackson Avenue, Long Island City, NY 11101"},{"name":"Panda NYC","address":"139 Chrystie Street; NY 10002"},{"name":"Panther Room","address":"74 Wythe Ave"},{"name":"The Paper Box","address":"17 Meadow St, Brooklyn, 11206"},{"name":"Parlor Private Club","address":"286 Spring St., NY 10013"},{"name":"Passion Lounge","address":"990 Broodway, Brooklyn, 11221"},{"name":"Passion Lounge","address":"167 Avenue U Brooklyn, NY 11223"},{"name":"Paul Hall - The Juilliard School","address":"155 W 65th Street, NY 10023"},{"name":"Penn Plaza Pavilion","address":"401 Seventh Avenue; NY 10001"},{"name":"People Kitchen and Lounge","address":"163 Allen St, NY 10002"},{"name":"Phuket","address":"701 w 135th st, NY"},{"name":"Pianos","address":"158 Ludlow Street; NY 10002"},{"name":"Pier 16, Skipper\'s Pierside Cafe","address":"89 South Street; NY 10038"},{"name":"Pier 17","address":"South Street Seaport, 12 Fulton St; NY 10038"},{"name":"Pier 54","address":"Hudson River Park, Pier 54 13th St. and West St; NY"},{"name":"Pink","address":"199 Bowery, Spring; NY"},{"name":"The Pink Elephant","address":"40 West 8th Street, NY"},{"name":"Place To Beach","address":"1301 Boardwalk West Coney Island (Corner of Stillwell and the boardwalk)"},{"name":"The Plank","address":"216 Bedford Ave, Brooklyn, NY 11249"},{"name":"Play Lounge","address":"77-17 Queens BLVD, Elmhurst, NY, 11373"},{"name":"PM Lounge NYC","address":"50 Ganesvoort st, Meatpacking District; NY"},{"name":"Polar","address":"201 e 24st (3rd ave inside Hotel Marcel Gramercy)"},{"name":"Powerhouse Arena","address":"37 Main Street; Brooklyn, NY 11201"},{"name":"Pranna","address":"28th Street and Madison Avenue; NY 10016"},{"name":"Preserved Instincts","address":"7811 Route 81. Oak Hill, NY. 12460"},{"name":"Prey","address":"4 West 22nd Street; NY 10010"},{"name":"The Production Lounge","address":"113 Franklin Street 1; Brooklyn, NY 11222"},{"name":"Promenade","address":"215 West 28th Street; New york, NY 10001"},{"name":"Providence","address":"311 West 57th, between 8th and 9th Ave, NY"},{"name":"Provocateur","address":"18 9th Avenue, NY 10014"},{"name":"Pt212","address":"30 West 24th Street; NY 10010"},{"name":"Puck Fair","address":"298 Lafayette Street; NY 10012"},{"name":"Pure Night Club","address":"62-05 30 Avenue Woodside, Astoria, NY 11102"},{"name":"Putnam Den","address":"63 Putnam St, Saratoga Springs, NY 12866"},{"name":"Pyramid Club Basement","address":"101 Avenue A, NY 10009"},{"name":"Queen of Hearts","address":"Pier #40 West Houston Street & West Side Highway; NY 10014"},{"name":"Quintessence","address":"11 New Scotland Avenue; Albany, NY 12208"},{"name":"Quo","address":"511 West 28th Street; NY 10001"},{"name":"Radio City Music Hall","address":"1260 Avenue of the Americas; NY 10020"},{"name":"Raine Lounge","address":"170 West 233rd Street, Bronx, NY 10463"},{"name":"Randall\'s Island","address":"Randall’s Island; NY 10035"},{"name":"Ravel Hotel","address":"808 Queenz Plaza South; NY 11101"},{"name":"The Raven","address":"55 Gansevoort Street NY 10014"},{"name":"Rebar","address":"147 Front Street; Brooklyn, NY 11201"},{"name":"Rebel","address":"251 West 30th Street; NY 10001"},{"name":"Reboot","address":"37 Avenue A. NY"},{"name":"Recoup Lounge","address":"210 Rivington Street; NY 10002"},{"name":"Red Square","address":"388 Broadway; Albany, NY 12207"},{"name":"Red Star Bar","address":"37 Greenpoint Avenue; Brooklyn, NY 11222"},{"name":"Red Velvet Lounge","address":"174 Rivington Street; NY 10002"},{"name":"Refuge","address":"1532 Decatur Street; Queens, NY 11385"},{"name":"Rehab","address":"25 Avenue B. bet. 2-3rd Avenues; NY"},{"name":"Retreat","address":"37 West 17 Street; NY 10011"},{"name":"Rewind","address":"137 Essex Street #1; NY 10002; Untied States"},{"name":"Rivington Hotel Penthouse","address":"107 Rivington Street; NY 10002"},{"name":"Rm Fifty5","address":"210 West 55th Street; NY 10019"},{"name":"Roam NYC","address":"5 East 19th Street; NY 10003"},{"name":"Rock Star Bar","address":"351 Kent Avenue; Brooklyn, NY 11211"},{"name":"Rockwood Music Hall","address":"196 Allen Street; NY 10002"},{"name":"Rooftop 48","address":"605 W.48th St., City"},{"name":"Rooftop 760","address":"760 8th Ave NY 10036"},{"name":"Roomservice","address":"35 East 21st Street; NY 10010"},{"name":"Rose Center for Earth and Space","address":"15 West 81st Street; NY"},{"name":"Rose Live Music","address":"345 Grand St; Brooklyn, NY"},{"name":"Roseland Ballroom","address":"239 West 52nd Street; NY 10019"},{"name":"Rosewood","address":"5 East 19th St NY 10003"},{"name":"Royalton Hotel Bar Fourty Four","address":"44 West 44th Street; NY 10036"},{"name":"Rumsey Playfield in Central Park","address":"Central Park; NY"},{"name":"Safe Harbor","address":"446 Broadway (3rd foor), NY 10013"},{"name":"The Sands Atlantic Beach","address":"1395 Beech Street, Atlantic Beach, 11509"},{"name":"Sankeys Brooklyn","address":"177 Second Ave, Brooklyn, NY 11215"},{"name":"Santos Party House","address":"96 Lafayette Street; NY 10013"},{"name":"Sapphire","address":"249 Eldridge Street; NY 10002"},{"name":"SB3","address":"33 Avenue B; NY 10009"},{"name":"The Secret Theatre","address":"4402 23rd Street; NY 11101"},{"name":"Seven One Ocho","address":"77-14 Queens Blvd Elmhurst, NY 11373"},{"name":"Shadow Lounge","address":"2085 Coney Island Avenue Brooklyn, N.Y. 11230"},{"name":"SHI","address":"4720 Center Boulevard; Queens, NY 11101"},{"name":"Silvana","address":"300 West 116th St 10026"},{"name":"Sip","address":"998 Amsterdam Avenue; NY 10025"},{"name":"Skidmore College","address":"815 North Broadway; Saratoga Springs, NY 12866"},{"name":"The Skinny","address":"174 Orchard Street; NY 10002"},{"name":"Sky Room","address":"330 West 40th Street, 33rd Floor; NY 10018"},{"name":"Slake","address":"251 West 30th St, NY 10001, USA"},{"name":"SLAM Warehouse","address":"51 North 1st Street; Brooklyn, NY 11211"},{"name":"Slate","address":"54 W. 21st St, NY 10010"},{"name":"SOBs","address":"204 Varick Street; NY 10014-4810"},{"name":"Soel Lounge","address":"02 Queens Blvd and 33rd Street; Long Island City; NY 11101"},{"name":"Soho Grand Hotel","address":"310 West Broadway, NYC"},{"name":"Soiree","address":"199 Bowery; NY 10002"},{"name":"Sol","address":"609 West 29th Street; NY 10001"},{"name":"Solas","address":"232 East 9th Street; NY 10003"},{"name":"South Street Seaport","address":"Fulton and South Streets; NY 10038"},{"name":"Southpaw","address":"125 Fifth Avenue; Brooklyn, NY 11217"},{"name":"Space Ibiza NY","address":"637 West 50th Street at 12th Avenue, NY"},{"name":"Spektrum NYC","address":"29 West 36th Street; NY 10018"},{"name":"Spiegelworld","address":"South Street Seaport; NY 10038"},{"name":"The Spot","address":"34 W 32nd St, NY 10001"},{"name":"Sputnik","address":"262 Taaffe Place; Brooklyn, NY 11205"},{"name":"SRB Brooklyn","address":"177 2nd Avenue, Brooklyn, NY"},{"name":"St Paul\'s Chapel","address":"Broadway, Fulton Street; NY"},{"name":"Stage 48","address":"605 W.48th St, City"},{"name":"Stage 48 NYC","address":"605 W 48th St, NY 10019"},{"name":"Stanton Public","address":"17 Stanton Street; NY 10003"},{"name":"Star Lounge","address":"222 West 23rd Street; NY 10011"},{"name":"Star of Palm Beach","address":"Pier 40 West Side Highway; NY 10014"},{"name":"Steamship Lilac","address":"Pier 40 West Side Highway; NY 10014"},{"name":"Strobe Lodge","address":"Buzzer 4e, 264 Canal St; NY"},{"name":"Studio 5 In 1","address":"60 North Sixth street; Brooklyn, NY"},{"name":"Studio B.P.M.","address":"237 Kent Ave; Brooklyn, NY 11211"},{"name":"Submercer","address":"147 Mercer Street; NY 10012"},{"name":"Subzero","address":"70 West Chippewa Street; Buffalo, NY 14202"},{"name":"Sullivan Hall","address":"214 Sullivan Street; NY 10012"},{"name":"Sutra Lounge","address":"16 1st Avenue; NY 10009"},{"name":"Suzie Wong","address":"547 West 27th Street; NY 10001"},{"name":"Sweet Revenge","address":"348 Franklin Ave, Brooklyn, NY 11238"},{"name":"System Dance Club","address":"32-10 37th Avenue; Long Island City, NY 11101"},{"name":"Tahona Nightclub","address":"35-35 Steinway Street; Astoria, NY 11101"},{"name":"Taj Lounge","address":"48 West 21st Street; NY 10010"},{"name":"Tammany Hall","address":"152 Orchard Street, Lower East Side, NY 10002"},{"name":"Tandem Bar","address":"236 Troutman Street; Brooklyn, NY 11237"},{"name":"The Tank","address":"354 West 45th Street; NY, NY 10036"},{"name":"Tantra","address":"35-50 31st Street Astoria, NY, 11106"},{"name":"TBA Brooklyn","address":"395 Wythe Ave; Brooklyn, NY 11249; USA"},{"name":"Teneleven","address":"171 Avenue C; NY 10009"},{"name":"Tenjune","address":"26 Little W 12th St; NY 10014"},{"name":"Terminal 5","address":"610 West 56th Street; NY 10019"},{"name":"The Beach at Governors Island","address":"Governorâ€™s Island; NY 11201"},{"name":"The303 at Louie & Chan","address":"303 Broome St, NY 10002, USA"},{"name":"Thom Bar","address":"60 Thompson Street; NY 10012"},{"name":"Thor","address":"107 Rivington Street; NY 10002"},{"name":"Times Square Arts Center","address":"669 8th Avenue; NY 10036"},{"name":"Tobacco Warehouse","address":"Water & New Dock St; Manhattan, NY"},{"name":"Tokya","address":"40 E 58th St, NY 10022"},{"name":"Toro Lounge In The Smyth Hotel","address":"85 W Broadway, NY 10007"},{"name":"Touch","address":"240 West 52nd Street; NY 10019"},{"name":"Town Hall","address":"123 West 43rd Street; NY 10036"},{"name":"Trexx Night Club","address":"323 North Clinton Street; Syracuse, NY 13202"},{"name":"The Triad Theater","address":"158 West 72nd Street; NY 10023"},{"name":"Tribeca Grand Hotel","address":"2 Avenue of the Americas, NY 10013"},{"name":"Trophy Bar","address":"351 Broadway; Brooklyn, NY 11211"},{"name":"Tropicana","address":"1061 Home Street; Bronx, NY 10459"},{"name":"Tuts Club","address":"196 Orchard Street; NY 10002"},{"name":"Tutu\'s","address":"25 Bogart Street, Brooklyn, 11206"},{"name":"Uncle Mike\'s","address":"57 Murray Street; NY 10007"},{"name":"Union Square Ballroom","address":"27 Union Square West NY 10003"},{"name":"Up & Down","address":"244 W. 14th St., 10011"},{"name":"The Vault","address":"Element, 225 East Houston; NY"},{"name":"Ventanas","address":"100 10th Avenue, NY 10010"},{"name":"Veranda","address":"130 7th Avenue; NY 10014"},{"name":"Verboten","address":"54 N 11th Street, Brooklyn NY 11211"},{"name":"Viking\'S Dungeon","address":"35-55 33rd Street; Queens, NY 11106"},{"name":"Viktor & Spoils","address":"105 Rivington Street; NY 10002"},{"name":"Village Lantern","address":"167 Bleecker Street, 10012"},{"name":"Villain","address":"50 North 3rd Street Brooklyn, 11249"},{"name":"Vintage West","address":"21 7th Avenue South & Leroy St; NY"},{"name":"W Hotel New York Downtown","address":"123 Washington Street, NY10006"},{"name":"Wall Street","address":"573 Nesconset Highway, Hauppauge, NY 11788"},{"name":"The Wall","address":"251 West 30th St, NY 10001, USA"},{"name":"Waltz-Astoria","address":"23-14 Ditmars Boulevard, Astoria, NY 11105"},{"name":"WAMU Theater","address":"7th Ave & 32nd Street; NY 10001"},{"name":"Warsaw","address":"261 Driggs Ave, Brooklyn, NY"},{"name":"Webster Hall","address":"125 East 11th Street; NY 10003"},{"name":"The Well","address":"272 Meserole St. Brooklyn, NY"},{"name":"Westbeth","address":"155 Bank Street, , 10014"},{"name":"Westcott Theater","address":"524 Westcott Street; Syracuse, NY 13202"},{"name":"The Westway","address":"75 Clarkson Street NY"},{"name":"WFC Garden","address":"220 Vesey Street; NY 10281"},{"name":"White House Hamptons","address":"239 Montauk Highway Hampton Bays, NY 11946"},{"name":"White Rabbit","address":"145 East Houston Street; NY 10002"},{"name":"White Slab Palace","address":"77 Delancey St, Lower East Side; NY 10002"},{"name":"Wicked Willy\'s","address":"149 Bleecker Street, NY 10012"},{"name":"Wonderland","address":"3801 23rd Avenue; Queens, NY 11105"},{"name":"The Woods","address":"48 S 4th St, Brooklyn, 11211"},{"name":"The World Bar","address":"845 United Nations Plaza; NY 10017"},{"name":"The Wreck Room","address":"940 Flushing Ave, Bushwick, Brooklyn, 11206"},{"name":"The Xchange","address":"640 West 28th Street; NY 10001"},{"name":"XL Nightclub","address":"512 West 42nd Street, NY"},{"name":"XVI Rooftop Lounge","address":"251 W. 48th S, NY 10019"},{"name":"Yotel Terrace","address":"570 10th Avenue Manhattan, NY 10036"},{"name":"Z Roof Rooftop Bar","address":"11-01 43rd Ave, Long Island City, NY 11101"},{"name":"Zamaan Bar","address":"349 Broadway, Brooklyn, NY 11211"},{"name":"Zaman Bar","address":"246 West 14th Street; NY"},{"name":"Zumbale","address":"91-01 Astoria Blvd, Queens NY"}]'))
# venues=JSON.parse(collection)
# (venues)
Genre.create([{name: "Indie"},{name: "Deep House"},{name: "Reggae/Dance Hall"}, {name: "Top-40"}, {name: "Latin"}, {name: "Hip Hop"}, {name: "Electronic"}])

Dj.create([{name: "Chainsmokers", demo:'<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/180881533&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>}', bio: "See them and understand why the sky is blue"}])