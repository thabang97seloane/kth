# Kasi Tech Hub — Website

Static website for **Kasi Tech Hub (Pty) Ltd**, a computer school in Refilwe, Cullinan.
No build step: plain HTML/CSS/JS, so it runs on any host (GitHub Pages, Netlify, cPanel, Afrihost, etc.).

| Page | File | Main search terms it targets |
|---|---|---|
| Home | `index.html` | computer school Cullinan, computer classes Refilwe |
| Programmes | `programmes.html` | computer courses Cullinan, MS Office / CV / NSFAS help Refilwe |
| About | `about.html` | Kasi Tech Hub, computer training centre Refilwe |
| Contact | `contact.html` | contact details, map, opening hours |

## Before going live: checklist

1. **Domain.** The site assumes `https://www.kasitechhub.co.za`. If your domain is different, replace it everywhere:
   `grep -rl kasitechhub.co.za . | xargs sed -i 's#https://www.kasitechhub.co.za#https://YOUR-DOMAIN#g'`
2. **Photos.** The photos are AI-generated and hosted on the image generator's CDN. Copy them into the site once (6 of the 12 are already included in `assets/img/photos/`):
   - **Windows:** open the website folder, click the address bar, type `powershell`, press Enter, then run
     `powershell -ExecutionPolicy Bypass -File scripts\download-images.ps1`
   - **Mac / Linux / Git Bash:** open a terminal in the website folder and run `bash scripts/download-images.sh`

   Both scripts save the photos to `assets/img/photos/` and point the pages at those copies.
   Over time, **replace them with real photos** of your classroom, building, trainers and learners (with their permission). Real photos build more trust and help you rank in Google Images and Maps. The building photo in particular shows a made-up sign, so swap it for a photo of the real entrance first.
3. **Check these details** (they were filled in with sensible defaults, so confirm or edit them):
   - Opening hours: Mon–Fri 08:00–17:00, Sat 08:00–13:00 (topbar, footer, contact page, and `openingHoursSpecification` in the JSON-LD)
   - Whether learners get a certificate of completion
   - The "Level / Format / Schedule" chips on `programmes.html`
   - The map pin: open the contact page and make sure it lands on 1609 10th Street
4. **Deploy**, then submit `https://YOUR-DOMAIN/sitemap.xml` in Google Search Console and Bing Webmaster Tools.

## SEO: what's already built in

- One `<h1>` per page, with keyword-focused titles and meta descriptions ("computer school", "computer classes", "Cullinan", "Refilwe")
- Schema.org JSON-LD: `EducationalOrganization` + `LocalBusiness` (address, geo, hours, phone, areas served), a `Course` for each programme, `FAQPage`, and `BreadcrumbList`
- Canonical URLs, Open Graph/Twitter cards, geo meta tags, `robots.txt`, and an XML sitemap with images
- Descriptive `alt` text on every image, lazy-loaded images, and mobile-first responsive layout
- A local-area section naming Refilwe, Cullinan, Rayton, Bronkhorstspruit, Ekangala, Mahube Valley, Mamelodi and Pretoria East
- Click-to-call, a WhatsApp button, and a WhatsApp enquiry form (Google counts these engagement signals, and they turn visitors into bookings)

## SEO: what YOU need to do to beat TYDA in search

The website alone won't get you to #1. For a search like "computer school Cullinan" or "computer classes near me", Google mostly shows the **Map Pack**, which is driven by your Google Business Profile and reviews. TYDA (Technology Youth Development Agency, Tshepong Multi-purpose Centre, Refilwe) already has an established website, a Facebook page and MICTSETA/SAQA accreditation, so these steps matter most:

1. **Google Business Profile (most important).** Create or claim it at business.google.com.
   - Primary category: **Computer training school**. Secondary: *Vocational school*, *Computer school*, *Education center*.
   - Use exactly the same name, address and phone as the website: `Kasi Tech Hub`, `1609 10th Street, Refilwe, Cullinan, 1003`, `079 949 1794`.
   - Add your hours, the website link, every programme as a "Service", and **at least 10 real photos** (outside, inside, classes). Post an update or photo every week.
2. **Reviews.** Ask every learner who finishes a course to leave a Google review, and reply to every review. Reviews are the biggest thing that moves you above a competitor in the Map Pack. Aim for more reviews than TYDA has, and more recent ones. Never buy reviews or write fake ones: Google removes them and can suspend your profile.
3. **Consistent listings (citations).** List the business with the *identical* name, address and phone on Facebook, Bing Places, Apple Business Connect, Yellow Pages SA, Brabys, Cylex and Snupit. Add the Facebook page URL to `"sameAs"` in the JSON-LD on each page.
4. **Local links.** Get linked from local sites: Cullinan/Refilwe community Facebook groups, the ward councillor's page, local schools, churches, and news sites that cover Cullinan. Offer a free "NSFAS application day" every January; local pages love sharing that kind of thing.
5. **Content.** Add a new page or post every month that answers a local question, e.g. "How to apply for NSFAS in Cullinan", "How to fill in the Z83 form", or "Free computer skills tips for job seekers in Refilwe".
6. **Accreditation (long term).** TYDA's biggest advantage is MICTSETA accreditation. Getting your own accreditation, or partnering with an accredited provider, would let you compete on learnerships and funded programmes too.
7. **Paid ads (optional, fastest).** A small Google Ads campaign on "computer classes Cullinan" puts you at the top immediately. You may target a competitor's name as a keyword, but you must **not** use their name in your ad text or on your website.

Do not copy TYDA's content, use their name on your pages, or make claims about them. It won't help your ranking and it creates legal risk. Compete on being closer, more personal and more beginner-friendly.

## Editing

- Colours and fonts are set in `assets/css/style.css` (`:root` variables).
- Text is in each `.html` file. The header and footer are repeated on every page, so edit them in all five files.
- The WhatsApp number is in `assets/js/main.js` (`WA_NUMBER`) and in the `wa.me` links.
