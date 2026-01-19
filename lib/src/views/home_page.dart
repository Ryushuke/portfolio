import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Importamos nossos arquivos criados
import '../core/utils/launcher_utils.dart';
import '../widgets/skill_chip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Ryushuke (Luis Eduardo Pedro)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text("Sobre")),
          TextButton(onPressed: () {}, child: const Text("Projetos")),
          const SizedBox(width: 20),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Escolhe o layout
                isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),

                const SizedBox(height: 100),

                // Seção Habilidades usando nosso Widget separado!
                Text(
                  "Minhas Habilidades",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: const [
                    SkillChip(label: "Flutter"),
                    SkillChip(label: "Dart"),
                    SkillChip(label: "Git & GitHub"),
                    SkillChip(label: "Firebase"),
                  ],
                ),

                const SizedBox(height: 100),
                const Divider(),
                const SizedBox(height: 20),
                const Text("Feito com Flutter Web 💙"),
              ],
            ),
          );
        },
      ),
    );
  }

  // Métodos privados para organizar o layout interno
  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _buildTextoIntro(textAlign: TextAlign.start)),
        const SizedBox(width: 40),
        Expanded(child: _buildAvatar()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildAvatar(),
        const SizedBox(height: 40),
        _buildTextoIntro(textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildAvatar() {
    return const CircleAvatar(
      radius: 120,
      backgroundColor: Colors.indigo,
      child: CircleAvatar(
        radius: 115,
        backgroundImage: NetworkImage(
          'https://avatars.githubusercontent.com/u/9919?s=400&v=4',
        ),
      ),
    );
  }

  Widget _buildTextoIntro({required TextAlign textAlign}) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.start
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          "Olá, eu sou o Fulano! 👋",
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        SelectableText(
          "Desenvolvedor Mobile & Web",
          textAlign: textAlign,
          style: GoogleFonts.poppins(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: textAlign == TextAlign.start
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              // Usando nosso UTILS aqui:
              onPressed: () => LauncherUtils.abrirLink('https://github.com/'),
              icon: const FaIcon(FontAwesomeIcons.github),
              label: const Text("GitHub"),
            ),
            const SizedBox(width: 15),
            OutlinedButton.icon(
              onPressed: () => LauncherUtils.abrirLink('https://linkedin.com/'),
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              label: const Text("LinkedIn"),
            ),
          ],
        ),
      ],
    );
  }
}
