import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../data/portfolio_data.dart';

class CVPdfGenerator {
  static Future<pw.Document> generateCV() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            color: PdfColor.fromHex('#0F0F0F'),
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header with name and contact info
                pw.Container(
                  padding: const pw.EdgeInsets.all(20),
                  decoration: pw.BoxDecoration(
                    color: PdfColor.fromHex('#1A1A1A'),
                    borderRadius: const pw.BorderRadius.all(
                      pw.Radius.circular(8),
                    ),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        PortfolioData.name,
                        style: pw.TextStyle(
                          fontSize: 32,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex('#E5E5E5'),
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'Email: ${PortfolioData.email}',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColor.fromHex('#60A5FA'),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'GitHub: ${PortfolioData.github}',
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColor.fromHex('#60A5FA'),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 30),

                // Work Experience Section
                pw.Text(
                  'WORK EXPERIENCE',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex('#FFFFFF'),
                  ),
                ),
                pw.SizedBox(height: 15),

                ...PortfolioData.workExperiences.map((exp) {
                  return pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 15),
                    padding: const pw.EdgeInsets.all(15),
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex('#1A1A1A'),
                      border: pw.Border.all(
                        color: PdfColor.fromHex('#2A2A2A'),
                        width: 1,
                      ),
                      borderRadius: const pw.BorderRadius.all(
                        pw.Radius.circular(8),
                      ),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          exp.company,
                          style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromHex('#E5E5E5'),
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          exp.position,
                          style: pw.TextStyle(
                            fontSize: 14,
                            color: PdfColor.fromHex('#A3A3A3'),
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          exp.dateRange,
                          style: pw.TextStyle(
                            fontSize: 12,
                            color: PdfColor.fromHex('#909090'),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                pw.SizedBox(height: 30),

                // Skills Section
                pw.Text(
                  'SKILLS',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex('#FFFFFF'),
                  ),
                ),
                pw.SizedBox(height: 15),
                ...PortfolioData.skills.map((skill) {
                  return pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 15),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              skill.name,
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('#E5E5E5'),
                              ),
                            ),
                            pw.Text(
                              skill.levelName,
                              style: pw.TextStyle(
                                fontSize: 12,
                                color: PdfColor.fromHex('#60A5FA'),
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 5),
                        pw.Stack(
                          children: [
                            pw.Container(
                              height: 8,
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromHex('#2A2A2A'),
                                borderRadius: const pw.BorderRadius.all(
                                  pw.Radius.circular(4),
                                ),
                              ),
                            ),
                            pw.Container(
                              height: 8,
                              width:
                                  500 *
                                  skill.levelPercentage, // Max width for A4
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromHex('#60A5FA'),
                                borderRadius: const pw.BorderRadius.all(
                                  pw.Radius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            color: PdfColor.fromHex('#0F0F0F'),
            width: double.infinity,
            padding: const pw.EdgeInsets.all(20),

            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,

              children: [
                // Projects Section
                pw.SizedBox(height: 30),
                pw.Text(
                  'PROJECTS',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex('#FFFFFF'),
                  ),
                ),
                pw.SizedBox(height: 15),
                ...PortfolioData.projects.map((project) {
                  return pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 15),
                    padding: const pw.EdgeInsets.all(15),
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex('#1A1A1A'),
                      border: pw.Border.all(
                        color: PdfColor.fromHex('#2A2A2A'),
                        width: 1,
                      ),
                      borderRadius: const pw.BorderRadius.all(
                        pw.Radius.circular(8),
                      ),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          project.title,
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromHex('#E5E5E5'),
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          project.description,
                          style: pw.TextStyle(
                            fontSize: 14,
                            color: PdfColor.fromHex('#A3A3A3'),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        ...project.links.entries.map((entry) {
                          return pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 3),
                            child: pw.Text(
                              '${entry.key}: ${entry.value}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                color: PdfColor.fromHex('#60A5FA'),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );

    return pdf;
  }
}
