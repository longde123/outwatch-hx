package outwatch.dom.helpers;

typedef Grouping<A, B> = { Key:A, Items:Array<B> }
class LambdaExtensions {
    public static function groupBy<A, B, C>(iter:Iterable<A>, keyFunction:A -> B, elementFunction:A -> C):Iterable<Grouping<B, C>> {
        var groupings:Array<Grouping<B, C>> = [];

        for (item in iter) {
            var keyValue = keyFunction(item);
            // A better groupBy implentation would use a O(1) lookup! Using find for simplicity only.
            var foundGrouping:Grouping<B, C> = Lambda.find(groupings, function(x:Grouping<B, C>) return x.Key == keyValue);

            var itemValue = elementFunction(item);
            if (foundGrouping == null) {
                foundGrouping = {
                    Key: keyValue,
                    Items: [itemValue]
                }
                groupings.push(foundGrouping);
            }
            else {
                foundGrouping.Items.push(itemValue);
            }
        }

        return groupings;
    }
}


