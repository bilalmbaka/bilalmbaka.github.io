// =============================================================
//  RESUME GENERATOR — builds a professional PDF resume from
//  the JSON data in src/data/. Edits there flow into the PDF.
// =============================================================
import { jsPDF } from "jspdf";
import profile from "../data/profile.json";
import experience from "../data/experience.json";
import education from "../data/education.json";
import skills from "../data/skills.json";
import contact from "../data/contact.json";

// Brand colors (match the site accent)
const ACCENT = [99, 102, 241]; // indigo
const INK = [28, 28, 36]; // body text
const GRAY = [105, 105, 118]; // secondary text
const HEADER_BG = [15, 15, 22];

export function buildResumeDoc() {
  const doc = new jsPDF({ unit: "mm", format: "a4" });
  const pageWidth = doc.internal.pageSize.getWidth();
  const pageHeight = doc.internal.pageSize.getHeight();
  const margin = 18;
  const contentWidth = pageWidth - margin * 2;
  let y = margin;
  const bottomLimit = pageHeight - 14;

  const spaceFor = (h) => {
    if (y + h > bottomLimit) {
      doc.addPage();
      y = margin;
    }
  };

  const section = (title) => {
    y += 4;
    spaceFor(12);
    doc.setFont("helvetica", "bold");
    doc.setFontSize(12);
    doc.setTextColor(ACCENT[0], ACCENT[1], ACCENT[2]);
    doc.text(title.toUpperCase(), margin, y);
    doc.setDrawColor(ACCENT[0], ACCENT[1], ACCENT[2]);
    doc.setLineWidth(0.4);
    doc.line(margin, y + 1.4, pageWidth - margin, y + 1.4);
    y += 7;
  };

  // Wrapped body text with consistent spacing
  const body = (text, opts = {}) => {
    const {
      size = 9.5,
      color = INK,
      bold = false,
      gap = 4.6,
      indent = 0,
      width = contentWidth,
    } = opts;
    doc.setFont("helvetica", bold ? "bold" : "normal");
    doc.setFontSize(size);
    doc.setTextColor(color[0], color[1], color[2]);
    const lines = doc.splitTextToSize(text, width);
    lines.forEach((line) => {
      spaceFor(gap);
      doc.text(line, margin + indent, y);
      y += gap;
    });
  };

  // ---------- Header (title) ----------
  doc.setFillColor(HEADER_BG[0], HEADER_BG[1], HEADER_BG[2]);
  doc.rect(0, 0, pageWidth, 36, "F");

  doc.setTextColor(255, 255, 255);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(23);
  doc.text(profile.name, margin, 18);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(12);
  doc.setTextColor(185, 190, 215);
  doc.text(profile.role, margin, 25);

  // ---------- Date + address (below the title header) ----------
  y = 43;
  doc.setFont("helvetica", "normal");
  doc.setFontSize(9.5);
  doc.setTextColor(GRAY[0], GRAY[1], GRAY[2]);
  const dateStr = new Date().toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
  const githubEntry = contact.links.find((l) => l.icon === "github");

  // Segments of the contact line; entries with a `url` become clickable text links
  const parts = [];
  if (dateStr) parts.push({ text: dateStr });
  if (contact.email) parts.push({ text: contact.email });
  if (githubEntry)
    parts.push({
      text: githubEntry.url.replace(/^https?:\/\//, ""),
      url: githubEntry.url,
    });
  parts.push({
    text: "bilalmbaka.github.io",
    url: "https://bilalmbaka.github.io/",
  });

  const sepText = "  |  ";
  const sepWidth = doc.getTextWidth(sepText);
  let x = margin;
  parts.forEach((part, idx) => {
    if (idx > 0) {
      doc.setTextColor(GRAY[0], GRAY[1], GRAY[2]);
      doc.text(sepText, x, y);
      x += sepWidth;
    }
    const w = doc.getTextWidth(part.text);
    if (part.url) {
      doc.setTextColor(ACCENT[0], ACCENT[1], ACCENT[2]);
      doc.textWithLink(part.text, x, y, { url: part.url });
    } else {
      doc.setTextColor(GRAY[0], GRAY[1], GRAY[2]);
      doc.text(part.text, x, y);
    }
    x += w;
  });
  y += 7;

  // ---------- Summary ----------
  section("Summary");
  body(profile.tagline, { gap: 4.8 });

  // ---------- Work Experience ----------
  section("Work Experience");
  experience.forEach((job) => {
    spaceFor(20);

    doc.setFont("helvetica", "bold");
    doc.setFontSize(10.5);
    doc.setTextColor(INK[0], INK[1], INK[2]);
    const roleLine = `${job.role}  ·  ${job.company}`;
    doc.text(doc.splitTextToSize(roleLine, contentWidth - 45)[0], margin, y);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(9);
    doc.setTextColor(ACCENT[0], ACCENT[1], ACCENT[2]);
    const period = `${job.period}${job.location ? `  ·  ${job.location}` : ""}`;
    doc.text(period, pageWidth - margin, y, { align: "right" });
    y += 5;

    if (job.summary) body(job.summary, { color: GRAY });

    if (job.points && job.points.length) {
      job.points.forEach((point) => {
        spaceFor(5);
        doc.setFillColor(ACCENT[0], ACCENT[1], ACCENT[2]);
        doc.circle(margin + 1.2, y - 1.2, 0.7, "F");
        doc.setFont("helvetica", "normal");
        doc.setFontSize(9.5);
        doc.setTextColor(INK[0], INK[1], INK[2]);
        const lines = doc.splitTextToSize(point, contentWidth - 7);
        lines.forEach((line) => {
          spaceFor(4.6);
          doc.text(line, margin + 4, y);
          y += 4.6;
        });
      });
    }
    y += 3;
  });

  // ---------- Education ----------
  section("Education");
  education.forEach((edu) => {
    spaceFor(12);
    doc.setFont("helvetica", "bold");
    doc.setFontSize(10.5);
    doc.setTextColor(INK[0], INK[1], INK[2]);
    doc.text(edu.degree, margin, y);
    doc.setFont("helvetica", "normal");
    doc.setFontSize(9);
    doc.setTextColor(ACCENT[0], ACCENT[1], ACCENT[2]);
    doc.text(edu.period, pageWidth - margin, y, { align: "right" });
    y += 5;
    body(`${edu.school}${edu.location ? `  ·  ${edu.location}` : ""}`, {
      color: GRAY,
      size: 9,
    });
    if (edu.details) body(edu.details, { color: GRAY, size: 9 });
    y += 2;
  });

  // ---------- Skills ----------
  section("Skills");
  skills.forEach((group) => {
    spaceFor(6);
    doc.setFont("helvetica", "bold");
    doc.setFontSize(9.5);
    doc.setTextColor(INK[0], INK[1], INK[2]);
    const label = `${group.category}: `;
    const labelWidth = doc.getTextWidth(label);
    doc.text(label, margin, y);
    doc.setFont("helvetica", "normal");
    doc.setTextColor(GRAY[0], GRAY[1], GRAY[2]);
    const itemsText = group.items.join(", ");
    const lines = doc.splitTextToSize(itemsText, contentWidth - labelWidth - 2);
    lines.forEach((line, idx) => {
      spaceFor(4.6);
      doc.text(line, idx === 0 ? margin + labelWidth : margin, y);
      y += 4.6;
    });
    y += 1;
  });

  // ---------- Footer (name + page number) ----------
  const totalPages = doc.internal.getNumberOfPages();
  for (let i = 1; i <= totalPages; i++) {
    doc.setPage(i);
    doc.setFont("helvetica", "normal");
    doc.setFontSize(8);
    doc.setTextColor(150, 150, 160);
    doc.text(profile.name, margin, pageHeight - 8);
    doc.text(`${i} / ${totalPages}`, pageWidth - margin, pageHeight - 8, {
      align: "right",
    });
  }

  return doc;
}

export function downloadResume() {
  const doc = buildResumeDoc();
  const fileName = `${profile.name.replace(/\s+/g, "_")}_Resume.pdf`;
  doc.save(fileName);
}
