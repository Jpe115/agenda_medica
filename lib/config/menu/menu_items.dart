
import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String link;
  final IconData icon;

  const MenuItem({required this.title, required this.link, required this.icon});
}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: "Doctores",  
    link: "/doctores", 
    icon: Icons.health_and_safety
  ),

  MenuItem(
    title: "Pacientes", 
    link: "/pacientes", 
    icon: Icons.people
  ),

  MenuItem(
    title: "Citas", 
    link: "/citas", 
    icon: Icons.alarm
  ),

  MenuItem(
    title: "Especialidades", 
    link: "/especialidades", 
    icon: Icons.headset
  ),

];