
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
    icon: Icons.credit_card
  ),

  MenuItem(
    title: "Pacientes", 
    link: "/pacientes", 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: "Citas", 
    link: "/citas", 
    icon: Icons.add
  ),

  MenuItem(
    title: "Especialidades", 
    link: "/especialidades", 
    icon: Icons.refresh_outlined
  ),

];