import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  // Lista de búsquedas recientes (simulada)
  final List<String> _recentSearches = [
    'Mindfulness',
    'Estrés',
    'Meditación',
    'Ansiedad',
    'Relajación',
    'Respiración',
    'Bienestar',
  ];

  @override
  void initState() {
    super.initState();
    // Auto-focus al campo de búsqueda cuando se abre la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _removeRecentSearch(int index) {
    setState(() {
      _recentSearches.removeAt(index);
    });
  }

  void _performSearch(String query) {
    // Implementar lógica de búsqueda
    if (query.trim().isNotEmpty) {
      // Aquí puedes navegar a resultados o actualizar la lista
      // TODO: Implementar búsqueda real
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra superior con botón de regreso y campo de búsqueda
            _buildSearchBar(),

            // Línea divisoria
            Divider(height: 0.5.h, color: AppColors.grey300, indent: 19.w, endIndent: 19.w),

            SizedBox(height: AppSpacing.mdH),

            // Sección de búsquedas recientes
            Expanded(child: _buildRecentSearches()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h, bottom: AppSpacing.mdH),
      child: Row(
        children: [
          // Botón de regreso
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 31.w,
              height: 29.h,
              alignment: Alignment.center,
              child: IconifyIcon(icon: 'icon-park-outline:left', color: AppColors.grey800, size: 24.sp),
            ),
          ),

          SizedBox(width: AppSpacing.smW),

          // Campo de búsqueda
          Expanded(
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(20.r),
                // border: Border.all(color: AppColors.grey300, width: 0.5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      onSubmitted: _performSearch,
                      onChanged: (value) {
                        setState(() {
                          // Actualizar UI para mostrar/ocultar botón cancelar
                        });
                      },
                      style: AppTypography.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        letterSpacing: 0.32,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        hintStyle: AppTypography.bodyMedium.copyWith(
                          fontSize: 18.sp,
                          letterSpacing: 0.32,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.r),
                          borderSide: BorderSide(color: Colors.transparent, width: 0.5.w),
                        ),
                        fillColor: AppColors.grey100,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      ),
                    ),
                  ),

                  if (_searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchController.clear();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: IconifyIcon(icon: 'material-symbols:cancel-outline-rounded', size: 20.sp),
                      ),
                    ),
                  // Botón cancelar/limpiar
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título "Recientes"
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text('Recientes', style: AppTypography.titleLarge.copyWith(fontSize: 20.sp)),
        ),

        // const SizedBox(height: AppSpacing.xs),

        // Lista de búsquedas recientes
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.smW),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _recentSearches.length,
              itemBuilder: (context, index) {
                return _buildRecentSearchItem(_recentSearches[index], index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentSearchItem(String searchText, int index) {
    return InkWell(
      onTap: () {
        _searchController.text = searchText;
        _performSearch(searchText);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
        child: Row(
          children: [
            // Ícono de búsqueda anterior (return to session)
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey300.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.smW),
                child: IconifyIcon(icon: 'fluent-mdl2:return-to-session', size: 14.sp),
              ),
            ),

            SizedBox(width: 12.w),

            // Texto de búsqueda
            Expanded(child: Text(searchText, style: AppTypography.bodyMedium.copyWith(fontSize: 18.sp))),

            // Botón para eliminar de recientes
            GestureDetector(
              onTap: () => _removeRecentSearch(index),
              child: IconifyIcon(icon: 'iconoir:cancel', size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
