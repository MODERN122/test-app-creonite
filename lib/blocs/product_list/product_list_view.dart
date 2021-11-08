import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:test_creonit/blocs/product_list/bloc/product_list_bloc.dart';
import 'package:test_creonit/constants.dart';
import 'package:test_creonit/models/category.dart';
import 'package:test_creonit/models/product.dart';
import 'package:test_creonit/repositories/pagination_loading_repository.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({this.category, Key? key}) : super(key: key);
  final Category? category;

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  late PaginationLoadingRepository listSourceRepository;
  @override
  void initState() {
    listSourceRepository =
        PaginationLoadingRepository(category: widget.category);
    super.initState();
  }

  @override
  void dispose() {
    listSourceRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingMoreList(
      ListConfig<Product>(
        shrinkWrap: true,
        itemBuilder: (context, Product product, index) =>
            BlocProvider<ProductListBloc>(
          create: (BuildContext context) => ProductListBloc(product),
          child: BlocConsumer<ProductListBloc, ProductListState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: 164,
                      width: 164,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.network(
                              product.image.file.url,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child:
                                Image.asset(Constants.iconsPath + "heart.png"),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                color: const Color(0xFF537B39),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    "ХИТ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        color: const Color(0x148A8884),
                        width: 164,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "${product.price} ₽",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => context
                                    .read<ProductListBloc>()
                                    .add(state is ProductInCart
                                        ? RemoveProductFromCart()
                                        : AddProductToCart()),
                                child: Image.asset(
                                  Constants.iconsPath + "cart.png",
                                  color: state is ProductInCart
                                      ? Colors.black
                                      : const Color(0xFF414951),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 164,
                      child: Text(
                        product.slug,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8A8884),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 79,
                      width: 164,
                      child: Text(
                        product.title,
                        style: TextStyle(
                            color: Color(0xFF414951),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                );
              }),
        ),
        indicatorBuilder: (context, indicatorStatus) {
          switch (indicatorStatus) {
            case IndicatorStatus.loadingMoreBusying:
              return Stack(children: const [
                Center(child: CircularProgressIndicator()),
              ]);
            case IndicatorStatus.noMoreLoad:
              return const Center(
                child: Text("Загружать больше нечего"),
              );
            default:
              return Wrap();
          }
        },
        sourceList: listSourceRepository,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

          
          mainAxisExtent: 333,
          crossAxisCount: 2,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 36.0,
        ),
      ),
    );
  }
}
