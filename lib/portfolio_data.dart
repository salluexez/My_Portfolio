import 'package:flutter/material.dart';

const resumeAssetPath = 'assets/resume/MOHD_SALAUDDIN_RESUME.pdf';
const resumeWebPath = 'assets/$resumeAssetPath';

class PortfolioLinks {
  static final Uri email = Uri(
    scheme: 'mailto',
    path: 'sallumalik1111@gmail.com',
    queryParameters: {
      'subject': 'Portfolio inquiry',
      'body': 'Hi Mohd Salauddin,',
    },
  );

  static final Uri phone = Uri(scheme: 'tel', path: '7983818754');
  static final Uri github = Uri.parse('https://github.com/salluexez');
  static final Uri linkedin = Uri.parse(
    'https://www.linkedin.com/in/mohd-salauddin',
  );

  // TODO: Replace these with the exact repository/demo URLs when available.
  static final Uri socraticAi = Uri.parse('https://github.com/salluexez');
  static final Uri alumniConnect = Uri.parse('https://github.com/salluexez');
}

class NavItem {
  const NavItem(this.label, this.icon);

  final String label;
  final IconData icon;
}

class StatItem {
  const StatItem(this.value, this.label);

  final String value;
  final String label;
}

class FocusCardData {
  const FocusCardData({
    required this.title,
    required this.subtitle,
    required this.body,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String subtitle;
  final String body;
  final IconData icon;
  final Color accent;
}

class TimelineItem {
  const TimelineItem({
    required this.title,
    required this.role,
    required this.period,
    required this.description,
    required this.tags,
    required this.accent,
    this.badge,
    this.link,
  });

  final String title;
  final String role;
  final String period;
  final String description;
  final List<String> tags;
  final Color accent;
  final String? badge;
  final Uri? link;
}

class EducationItem {
  const EducationItem(this.degree, this.school, this.period);

  final String degree;
  final String school;
  final String period;
}

const navItems = [
  NavItem('Home', Icons.home_outlined),
  NavItem('Status', Icons.speed_outlined),
  NavItem('Work', Icons.work_outline),
  NavItem('Projects', Icons.auto_awesome_outlined),
  NavItem('Resume', Icons.description_outlined),
  NavItem('Contact', Icons.mail_outline),
];

const heroStats = [
  StatItem('MCA', 'CURRENT DEGREE'),
  StatItem('2+', 'MAJOR BUILDS'),
  StatItem('11', 'GLOBAL CTF RANK'),
  StatItem('1st', 'IIT DELHI TRYST'),
];

const focusCards = [
  FocusCardData(
    title: 'MCA Student',
    subtitle: 'Central University of Himachal Pradesh',
    body: 'Building depth in software engineering, systems, and applied CS.',
    icon: Icons.school_outlined,
    accent: Color(0xFF21C76F),
  ),
  FocusCardData(
    title: 'Flutter + Firebase',
    subtitle: 'Cross-platform product work',
    body:
        'Responsive apps, auth, real-time data, storage, Bloc/Cubit patterns.',
    icon: Icons.phone_iphone_outlined,
    accent: Color(0xFF4385F5),
  ),
  FocusCardData(
    title: 'AI Systems',
    subtitle: 'Tutors, chatbots, summarizers',
    body: 'Next.js, Flutter, Express, MongoDB, FastAPI, Gemini integrations.',
    icon: Icons.psychology_alt_outlined,
    accent: Color(0xFFD94FC4),
  ),
  FocusCardData(
    title: 'Security Mindset',
    subtitle: 'CTF + cybersecurity',
    body: 'Redfox CTF global rank 11 and DARK CTF national rank 13.',
    icon: Icons.security_outlined,
    accent: Color(0xFFF0B429),
  ),
];

const workItems = [
  TimelineItem(
    title: 'Medixcy',
    role: 'Full Stack Developer Intern',
    period: 'May 2025 - Nov 2025',
    badge: 'Internship',
    description:
        'Developed a cross-platform Flutter app with Firebase auth, real-time data, backend services, responsive UI, and AI-driven summarization/chatbot features using Google Gemini API.',
    tags: ['Flutter', 'Firebase', 'Gemini API', 'Responsive UI'],
    accent: Color(0xFF111111),
  ),
];

final projectItems = [
  TimelineItem(
    title: 'Socratic AI',
    role: 'AI tutoring system',
    period: 'Next.js + Flutter + Express + MongoDB + FastAPI',
    badge: 'Featured',
    description:
        'Built a Socratic-method tutoring experience that guides students through reasoning instead of handing over direct answers, with session continuity and personalized guidance.',
    tags: ['Next.js', 'Flutter', 'Express', 'MongoDB', 'FastAPI'],
    accent: Color(0xFF6547FF),
    link: PortfolioLinks.socraticAi,
  ),
  TimelineItem(
    title: 'Alumni Connect',
    role: 'Student-alumni mentorship app',
    period: 'Flutter + Firebase',
    badge: 'Mobile',
    description:
        'Created real-time messaging, role-based dashboards, Firestore/Auth/Storage integration, and a clean Bloc/Cubit architecture for scalable campus communication.',
    tags: ['Flutter', 'Firebase', 'Firestore', 'Bloc/Cubit'],
    accent: Color(0xFF00A88A),
    link: PortfolioLinks.alumniConnect,
  ),
];

const educationItems = [
  EducationItem(
    'Master of Computer Applications (MCA)',
    'Central University of Himachal Pradesh, India',
    '2024 - 2026',
  ),
  EducationItem(
    'Bachelor of Science in Physics, Chemistry, Mathematics',
    'Sri Dev Suman Uttarakhand University, India',
    '2021 - 2024',
  ),
];

const languageSkills = ['Dart', 'Python', 'JavaScript', 'SQL', 'HTML', 'CSS'];
const frameworkSkills = ['Flutter', 'React.js', 'Next.js', 'FastAPI'];
const coreSkills = ['DSA', 'CN', 'DBMS', 'OS', 'OOP'];
const toolSkills = [
  'Git',
  'GitHub',
  'OpenAI GPT',
  'Anthropic Claude',
  'Agile',
  'Scrum',
];

const achievements = [
  'Fundamentals of Cybersecurity - Coursera',
  'Flutter Development Bootcamp - freeCodeCamp',
  'Best Innovation Award - Chaitanya 1.0 Hackathon',
  'Global Rank 11 - Redfox CTF 2026',
  'Rank 13 National - DARK CTF 2026',
  '1st Prize - TMMC & Prompt Engineering, IIT Delhi Tryst',
];
