# Serial Scanner

Point your phone at one of the printed QR codes. It shows you the serial number in large
type and copies it to the clipboard.

It reads the serial out of the URL the QR encodes, so
`https://neelng7.github.io/Portfolio/?sn=0007-K7M2` shows **`0007-K7M2`** — not the whole
link. A QR holding a bare serial works too.

---

## On your laptop

Double-click `index.html`. Chrome treats `file://` as a secure page, so the camera works
straight away. Useful for checking a batch without picking up your phone.

## On your iPhone — it has to be online first

**A web page can only use the camera over `https://`.** Safari will refuse on a `file://`
page or a plain `http://` address, so AirDropping this folder to your phone will not work.
There is no way around it; it is a browser security rule, not a setting.

The quickest fix is to publish it alongside your portfolio, which is already on HTTPS:

```sh
deploy.cmd
```

That copies this folder into `qr-result/scan/`. Then, from `qr-result`:

```sh
git add scan
git commit -m "Add serial scanner"
git push
```

Within about ten minutes it is live at:

**<https://neelng7.github.io/Portfolio/scan/>**

Open that on your iPhone, tap **Start camera**, and allow access when Safari asks.

### Make it feel like an app

In Safari, tap **Share ▸ Add to Home Screen**. It then opens full-screen with its own
icon, with no address bar — much nicer when you are working through a stack of prints.

---

## Using it

1. **Start camera** — Safari asks permission the first time.
2. Hold the QR inside the white frame. It scans continuously; there is no shutter button.
3. On a hit: the frame flashes green, it beeps, and the serial appears in large type.
4. **Copy** puts it on the clipboard. **Scan another** goes back to the camera.
5. Everything scanned this session is listed underneath — tap any entry to copy it again.

Tapping **Scan another** ignores *that same code* for a couple of seconds, so it does not
immediately re-read the copy still under the camera. A different code registers instantly,
so you can work through a pile without pausing.

---

## About the clipboard on iPhone

Safari only allows a page to write to the clipboard during a tap. A camera frame is not a
tap, so the automatic copy on scan **may not work on iOS** — you will see
*"Tap Copy to put it on the clipboard"* instead of *"Copied to clipboard"*. The **Copy**
button always works, because tapping it is the gesture Safari wants.

The serial is also styled so a single long-press selects the whole thing, if you would
rather copy it that way.

---

## If the camera will not start

- **"The camera needs a secure page"** — you are on `file://` or `http://` on a phone.
  Use the published `https://` address.
- **Access blocked** — Settings ▸ Apps ▸ Safari ▸ Camera ▸ Allow, then reload. If you
  tapped "Don't Allow", reloading the page makes Safari ask again.
- **Nothing decodes** — move closer or further back so the code fills the white frame, and
  avoid glare on glossy paper. Below about 15 mm printed, codes get hard for any phone.

---

## Files

| Path | What it is |
|---|---|
| `index.html` | the whole app — markup, styles and logic |
| `vendor/jsQR.js` | the QR decoder (MIT) |
| `deploy.cmd` | copies this folder into `qr-result/scan/` for publishing |

Nothing is uploaded anywhere and nothing is stored — the session list lives in memory and
disappears when you close the tab. The camera feed never leaves your phone.
