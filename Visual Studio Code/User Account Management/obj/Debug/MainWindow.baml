   M S B A M L   `   `   `  ����R  NUser Account Management, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:User_Account_ManagementUser_Account_Management  5   	   (    "User_Account_Management.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:User_Account_Management     5   	     � Title$  User Account Management��5   	   $	��442��6)   $	��442��66    � 
ResizeMode$ NoResize=�6B    � WindowStartupLocation$ CenterScreen=�6X   ���	#FF728BC5 � Icon$� �\\filestorage\StaffDepartmentalStandard\Computer Services\Powershell GUI Tools\Projects\User Account Management\Images\TRC LOGO.png��6�   .��5	      �  J� RenderTransformOrigin$ 0.5,0.5&�6    � RowDefinitions 5
   
   �� 5      $
��113* �6   �� 5      $
��300* �6   z�5   
   V� 5      .~�5      �� �� 5      �� 5       �� Angle$ -0.274Q�6"   T� 5      5       � ColumnDefinitions 5   
   �� 5      $	��48* �6   �� 5      $	��47* �6   �� 5      $
��123* �6   .+�5   
   �� -   5         ��Name$ UsernameInput��5      $
��Left=�6)   $��23��6D   $��3,22,0,0q�6P   	 �� TextWrapping$
	 Wrap=�6b   $	��Top=�6v   $	��153��6�   $��Arial)�6�   $
��Bold"�6�   4  .System.Windows.Automation.AutomationProperties
   HelpText$3
 -Enter the username/student ID into this field��6�   $��2��6  ���	#FFF3F8FB$��16(�64  �� 5   
   -   5         ��Name$ UserNameLabel��5      $��Enter Student ID:��6'   $
��Left=�6C   $��	61,19,0,0q�6^   $	��Top=�6q   $	��135��6�   $��Arial)�6�   $��3��6�   $��30��6�   $��16(�6�   $ 0.5,0.5&�6�   z�5      V� 5      .~�5      �� �� 5        �� AngleX$ -1.497Q�6$   �� 5!      T� 5"       T� X$ -0.314Q�6)   5#      5%      	� 5&   
   -   5         	�Name$ CheckAccountStatus��5&      $��Check Account Status��62   $
��Left=�6Q   $��	28,79,0,0q�6l   $	��Top=�6   $��3��6�   $��27��6�   $	��200��6�   $��16(�6�   	� 5'   
   -   5        $ UnlockAccount��5'      $��Unlock Account��6-   $
��Left=�6F   $��
28,111,0,0q�6a   $	��Top=�6u   $��16(�6�   $��2��6�   $��2��6�   	� 5(   
   -   5        $ ResetPassword��5(      $��Reset Password��6-   $
��Left=�6F   $��	28,32,0,0q�6a   $	��Top=�6t   $��16(�6�   $��1��6�   $��2��6�   	� 5)   
   -   5        $ DisableAccount��5)      $��Disable Account��6.   $
��Left=�6H   $��	28,99,0,0q�6c   $	��Top=�6v   $��16(�6�   $��1��6�   $��2��6�   	� 5*   
   -   5        $ EnableAccount��5*      $��Enable Account��6-   $
��Left=�6F   $��	28,65,0,0q�6a   $	��Top=�6t   $��16(�6�   $��1��6�   $��2��6�   �� 5+   
   -   5        $ PasswordEntry��5+      $
��Left=�6)   $��23��6E   $��
70,160,0,0q�6Q   $
	 Wrap=�6e   $��Welcome2ThomasRotherham!��6y   $	��Top=�6�   $	��302��6�   ���	#FFF3F8FB$��1��6�   $��3��6�   
���   �6�   �� 5,   
   -	   5         ��Name$ Action��5,      $��Select��6!   $
��Left=�62   $��
54,135,0,0q�6M   $	��Top=�6a   $��89��6y   $��1��6�   $��2��6�   �� 5-   
   -
   5        $ Results��5-      $
��Left=�6#    �� 
IsReadOnly . $��99��6R   $��
70,185,0,0q�6^   $
	 Wrap=�6r   $	��Top=�6�   $	��302��6�   $��3��6�   $��1��6�   $ 0.5,0.5&�6�   
���   �.��6�   z�5.      V� 5/      .~�50      �� �� 51      �� 52      $ -0.111Q�6&   T� 53      54      .��55   '   56      �� 57   
   -   5        $ Check��57      $��Check��6    $��2��60   $
��Left=�6@   $��23��6[   $��
156,22,0,0q�6g   $	��Top=�6{   $��54��6�   $
��Bold"�6�   �� 58   
   -   5         ��Name$ 	UserImage��58      $��2��6#   $
��Left=�63   $	��153��6N   $��	50,89,0,0q�6[   $	��Top=�6n   $	��150��6�   $
��Fill=�6�    J� OpacityMask
 �   �$��2��6�   �� 59   
   -   5        $ 	InfoLabel��59      $�� ��6#   $��2��6.   $
��Left=�6>   $��56,129,0,132q�6Y   $��Center=�6o   $��39��6�   $	��180��6�   $��Disabled=�6�   $
��Bold"�6�   $��1��6�   $��16(�6�   �� 5:   
   $�� ��6   $
��Left=�6   $��46��66   $	��Top=�6B   $��44��6Z   $��	10,10,0,0q�6e   ��5;      �� 5<       �� ImageSource$� �\\filestorage\StaffDepartmentalStandard\Computer Services\Powershell GUI Tools\Projects\User Account Management\Images\TRC LOGO.png��6   5>      5@      5A      