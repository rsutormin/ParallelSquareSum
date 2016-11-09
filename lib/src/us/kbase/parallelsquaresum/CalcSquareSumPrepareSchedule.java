
package us.kbase.parallelsquaresum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: CalcSquareSumPrepareSchedule</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "tasks",
    "collect_method"
})
public class CalcSquareSumPrepareSchedule {

    @JsonProperty("tasks")
    private List<CalcSquareSumRunEachInput> tasks;
    /**
     * <p>Original spec-file type: FullMethodQualifier</p>
     * <pre>
     *  ===================== prepare =====================
     * </pre>
     * 
     */
    @JsonProperty("collect_method")
    private FullMethodQualifier collectMethod;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("tasks")
    public List<CalcSquareSumRunEachInput> getTasks() {
        return tasks;
    }

    @JsonProperty("tasks")
    public void setTasks(List<CalcSquareSumRunEachInput> tasks) {
        this.tasks = tasks;
    }

    public CalcSquareSumPrepareSchedule withTasks(List<CalcSquareSumRunEachInput> tasks) {
        this.tasks = tasks;
        return this;
    }

    /**
     * <p>Original spec-file type: FullMethodQualifier</p>
     * <pre>
     *  ===================== prepare =====================
     * </pre>
     * 
     */
    @JsonProperty("collect_method")
    public FullMethodQualifier getCollectMethod() {
        return collectMethod;
    }

    /**
     * <p>Original spec-file type: FullMethodQualifier</p>
     * <pre>
     *  ===================== prepare =====================
     * </pre>
     * 
     */
    @JsonProperty("collect_method")
    public void setCollectMethod(FullMethodQualifier collectMethod) {
        this.collectMethod = collectMethod;
    }

    public CalcSquareSumPrepareSchedule withCollectMethod(FullMethodQualifier collectMethod) {
        this.collectMethod = collectMethod;
        return this;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperties(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return ((((((("CalcSquareSumPrepareSchedule"+" [tasks=")+ tasks)+", collectMethod=")+ collectMethod)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
