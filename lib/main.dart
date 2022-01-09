import 'package:flutter/material.dart';
import 'package:todos/quote.dart';
import 'package:todos/quote_card.dart';
import 'package:todos/new_quote.dart';

void main() {
  runApp(MaterialApp(
    home: const QuoteList(),
    routes: {
      "/home": (context) => const QuoteList(),
      "/second": (context) => const SecondScreen(),
    },
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: "Me", text: "Hello Every One"),
    Quote(author: "Me", text: "This is your captain speaking"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Awesome quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                  quote: quote,
                  delete: () => {
                    setState(() {
                      print('remove');
                      quotes.remove(quote);
                    })
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       quotes.add(Quote(author: "You And Me", text: "We got this!"));
      //     });
      //   },
      // ),
    );
  }
}
